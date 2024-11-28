import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/user_model.dart';
import 'package:hep_fit/app/repositories/app_repositories.dart';
import 'package:mobx/mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  AppRepositorie appRepositorie = AppRepositorie();

  @observable
  UserModel user = UserModel();
  @observable
  bool loadUser = false;

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
  Future <void> logOutUser() async {
    var retorno = await appRepositorie.logOut();
    if(retorno){
      Modular.to.navigate("/");
      Fluttertoast.showToast(
          msg: "LOGOUT EFETUADO COM SUCESSO",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "ERRO AO EFETUAR LOGOUT",
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