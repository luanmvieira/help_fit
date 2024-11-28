import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/user_model.dart';

class AppRepositorie {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  UserModel _user = UserModel();


  bool resultado = false;

  Future<bool> checkCurrentUser() async {
    User? user = await _auth.currentUser;
    return user != null ? true : false;
  }

  Future <UserModel> getCurrentUser() async{
    QuerySnapshot _userQuery = await _db.collection("usuarios").where("email", isEqualTo: _auth.currentUser!.email).get();
    if(_userQuery.docs.isNotEmpty){
      print("não é vazio doc");
      _user = UserModel.fromMap(_userQuery.docs.first);
      print("carregou model");
    }else{
      print("não carregou model");
    }
    print("Email: ${_user.email.toString()}");
    return _user;
  }

  Future <bool> logOut() async {
    try{
      await _auth.signOut();
      return true;
    }catch(e){
      print("ocorreu um erro ao fazer logout $e");
      return false;
    }

  }

}