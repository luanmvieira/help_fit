import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/assessment_model.dart';
import 'package:hep_fit/app/models/user_model.dart';
import 'package:hep_fit/app/modules/assessment/repositories/assessment_repositories.dart';
import 'package:hep_fit/app/repositories/app_repositories.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'assessment_store.g.dart';

class AssessmentStore = _AssessmentStoreBase with _$AssessmentStore;
abstract class _AssessmentStoreBase with Store {

  ConexaoFirebaseAssessment _db = ConexaoFirebaseAssessment();
  AppRepositorie appRepositorie = AppRepositorie();

  @observable
  ObservableList<XFile> images = ObservableList<XFile>();

  @observable
  ObservableList<String> linkDownloadImages = ObservableList<String>();

  @observable
  UserModel user = UserModel();
  @observable
  AssessmentModel currentAssessment = AssessmentModel();
  @observable
  bool loadAssessment = false;
  @observable
  bool loadUser = false;

  final cxMEController = TextEditingController();
  final cxMDController = TextEditingController();
  final ptDController = TextEditingController();
  final ptEController = TextEditingController();
  final antDController = TextEditingController();
  final antEController = TextEditingController();
  final brcDController = TextEditingController();
  final brcEController = TextEditingController();
  final abdController = TextEditingController();
  final cntController = TextEditingController();
  final ombController = TextEditingController();
  final trxController = TextEditingController();
  final qdrController = TextEditingController();

  @action
  clearControllers(){
    cxMEController.clear();
    cxMDController.clear();
    ptDController.clear();
    ptEController.clear();
    antDController.clear();
    antEController.clear();
    brcDController.clear();
    brcEController.clear();
    abdController.clear();
    cntController.clear();
    ombController.clear();
    trxController.clear();
    qdrController.clear();
  }






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

  @action
  addPhotoInList(XFile photo){
    images.add(photo);
  }

  sendNewAssessment() async {
    if(cxMEController.text.isEmpty ||
        cxMDController.text.isEmpty ||
        ptDController.text.isEmpty ||
        ptEController.text.isEmpty||
        antDController.text.isEmpty||
        antEController.text.isEmpty||
        brcDController.text.isEmpty||
        abdController.text.isEmpty||
        cntController.text.isEmpty||
        ombController.text.isEmpty||
        trxController.text.isEmpty||
        qdrController.text.isEmpty||
        brcEController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "PREENCHA TODOS OS CAMPOS",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      if(images.isEmpty){
        Fluttertoast.showToast(
            msg: "ADICIONE AO MENOS UMA FOTO",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return false;
      }else{
        List<Uint8List> listImagesBytes = [];
        for(var image in images){
          listImagesBytes.add(await image.readAsBytes());
        }
        List<String> listPathPhotos = await _db.uploadArchive(user.email,listImagesBytes);
        if(listPathPhotos.isNotEmpty){
          AssessmentModel assessmentModel =
          AssessmentModel(
              email: user.email,
              listPhotos: listPathPhotos,
              coxaD: cxMDController.text,
              coxaE: cxMEController.text,
              panturrilhaD: ptDController.text,
              panturrilhaE: ptEController.text,
              antebracoD: antDController.text,
              antebracoE: antEController.text,
              bracoD: brcDController.text,
              bracoE: brcEController.text,
              abdomem: abdController.text,
              cintura: cntController.text,
              ombro: ombController.text,
              torax: trxController.text,
              quadril: qdrController.text);
          var retorno = await _db.saveAssessment(assessmentModel);
          if(retorno){
            Modular.to.pop();
            Fluttertoast.showToast(
                msg: "AVALIAÇÃO CADASTRADA COM SUCESSO",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }else{
            Fluttertoast.showToast(
                msg: "AVALIAÇÃO NÃO CADASTRADA, TENTE NOVAMENTE",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );

          }

        }else{
          Fluttertoast.showToast(
              msg: "AVALIAÇÃO NÃO CADASTRADA, TENTE NOVAMENTE",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }


      }

    }
  }

  Future getFiles(List<String> paths) async {
    for(var path in paths){
      final ref = FirebaseStorage.instance.ref().child(path);
      String downloadURL = await ref.getDownloadURL();
      linkDownloadImages.add(downloadURL);
    }

  }

  getAssessment() async {
    loadAssessment = true;
    await getUser();
    var assessment = await _db.getCurrentAssessment(user);
    if(assessment.email != null){
      currentAssessment = assessment;
      if(currentAssessment.listPhotos!.isNotEmpty){
        await getFiles(currentAssessment.listPhotos!);
      }
    }


    loadAssessment = false;

  }
  deleteAssessment() async {
    loadAssessment = true;
    await getUser();
    var retorno = await _db.deleteAssessment(user);
    if(retorno){
      await getAssessment();
      Fluttertoast.showToast(
          msg: "AVALIAÇÃO DELETADA COM SUCESSO",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "OCORREU UM ERRO AO DELETAR A AVALIAÇÃO, TENTE NOVAMENTE",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


    loadAssessment = false;

  }


}