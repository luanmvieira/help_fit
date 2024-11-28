import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/day_training_model.dart';
import 'package:hep_fit/app/models/user_model.dart';
import 'package:hep_fit/app/modules/training/repositories/training_repositories.dart';
import 'package:hep_fit/app/repositories/app_repositories.dart';
import 'package:mobx/mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'training_store.g.dart';

class TrainingStore = _TrainingStoreBase with _$TrainingStore;
abstract class _TrainingStoreBase with Store {

  AppRepositorie appRepositorie = AppRepositorie();
  TrainingRepositories trainingRepositories = TrainingRepositories();

  @observable
  UserModel user = UserModel();
  @observable
  List<DayTrainingModel> dayTraining = [];
  @observable
  bool loadUser = false;
  @observable
  bool loadTrainingDay = false;
  @observable
  bool loadSendNewExercise = false;
  @observable
  String currentDay = "";

  final nameExerciseController = TextEditingController();
  final setsExerciseController = TextEditingController();
  final repsExerciseController = TextEditingController();
  final breakTimeExerciseController = TextEditingController();

  @action
  Future <void> getUser() async {
    try{
      loadUser = true;
      user = await appRepositorie.getCurrentUser();
      loadUser = false;
    }catch(e){
      loadUser = false;
      print("Aconteceu um erro: $e");
    }
  }

  Future <void> addExerciseInTraining() async {
    try{
      loadSendNewExercise = true;
      if(nameExerciseController.text.isEmpty ||
          setsExerciseController.text.isEmpty ||
          repsExerciseController.text.isEmpty ||
          breakTimeExerciseController.text.isEmpty){
        Fluttertoast.showToast(
            msg: "PREENCHA TODOS OS CAMPOS",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        loadSendNewExercise = false;
      }else{
        var newExercise = ExerciseModel(
            name: nameExerciseController.text,
            sets: setsExerciseController.text,
            reps: repsExerciseController.text,
            breakTime: breakTimeExerciseController.text);
        if(dayTraining.isEmpty){
          DayTrainingModel trainingModel = DayTrainingModel(
              day:currentDay,
              email: user.email,
              exercises: [newExercise] );
          await trainingRepositories.saveDayTraining(trainingModel);
          loadSendNewExercise = false;
        }else{
          dayTraining[0].day = currentDay;
          dayTraining[0].email = user.email;
          dayTraining[0].exercises.add(newExercise);

          await trainingRepositories.saveDayTraining(dayTraining[0]);
          loadSendNewExercise = false;
        }
        getDayTrainingByDay();
        Modular.to.pop();
        clearControllers();
      }
    }catch(e){
      print("Ocorreu o seguinte erro: $e");
      loadSendNewExercise = false;
    }


  }
  @action
  setDay(String day){
    currentDay = day;
  }
  @action
  clearDayTraining(){
    dayTraining = [];
  }
  @action
  clearControllers(){
    nameExerciseController.clear();
    setsExerciseController.clear();
    repsExerciseController.clear();
    breakTimeExerciseController.clear();
  }

  @action
  deleteDayTraining() async {
    loadTrainingDay = true;
    var retorno = await trainingRepositories.deleteDayTraining(dayTraining[0]);
    if(retorno){
      getDayTrainingByDay();
      Fluttertoast.showToast(
          msg: "EXERCICIOS EXCLUIDOS COM SUCESSO",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      loadTrainingDay = false;
    }else{
      loadTrainingDay = false;
      Fluttertoast.showToast(
          msg: "ERRO AO EXCLUIR OS EXERCICIOS",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @action
  getDayTrainingByDay() async {
    try{
      loadTrainingDay = true;
      dayTraining = await trainingRepositories.getTrainingsByEmailAndDay(user.email, currentDay);
      loadTrainingDay = false;
    }catch(e){
      print("ocorreu um erro $e");
      loadTrainingDay = false;
    }

  }


}