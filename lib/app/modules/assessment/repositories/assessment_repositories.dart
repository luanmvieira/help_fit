import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hep_fit/app/models/assessment_model.dart';
import 'package:hep_fit/app/models/user_model.dart';





class ConexaoFirebaseAssessment {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future <List<String>> uploadArchive(String ref,List <Uint8List> arquivos) async {
    final storageRef = FirebaseStorage.instance.ref();
    List <String> listPaths = [];
    try {
      for( int i = 0; i< arquivos.length; i++){
        final spaceRef = storageRef.child("arquivos/${ref}_$i");
        final path = spaceRef.fullPath;
        await spaceRef.putData(arquivos[i]);
        listPaths.add(path);
        print("Uploading complete to $path");
      }
      return listPaths;
    } catch (e) {
      print("Error uploading : $e");
      return listPaths;
    }
  }

  Future<bool> saveAssessment(AssessmentModel assessment) async {
    try {
      await _db.collection('assessments').doc(assessment.email).set(assessment.toMap());
      print('Avaliação salva com sucesso!');
      return true;
    } catch (e) {
      print('Erro ao salvar a avaliação: $e');
      return false;
    }
  }

  Future<bool> deleteAssessment(UserModel user) async {
    try {
      await _db.collection('assessments').doc(user.email).delete();
      print('Avaliação deletada com sucesso!');
      return true;
    } catch (e) {
      print('Erro ao deletar a avaliação: $e');
      return false;
    }
  }
  Future <AssessmentModel> getCurrentAssessment(UserModel user) async{
    AssessmentModel assessmentModel = AssessmentModel();
    QuerySnapshot _userQuery = await _db.collection("assessments").where("email", isEqualTo: user.email).get();
    if(_userQuery.docs.isNotEmpty){
      print("não é vazio doc");
      assessmentModel = AssessmentModel.fromMap(_userQuery.docs.first);
      return assessmentModel;
    }else{
      print("não carregou model");
      return assessmentModel;
    }
  }



}
