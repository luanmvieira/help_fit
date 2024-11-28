import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/user_model.dart';
import 'package:hep_fit/app/modules/login/repositories/db_login.dart';
import 'package:mobx/mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';


part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {
  @observable
  UserModel usuarioLogin = UserModel();

  @observable
  bool progressLogin  = false;

  UserModel usuario = UserModel();
  ConexaoFirebaseLogin dbLogin = ConexaoFirebaseLogin();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final emailLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  @action
  clearControllers(){
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    emailLoginController.clear();
    passwordLoginController.clear();

  }

  @action
  Future realizarLogin() async {
    if(emailLoginController.text.isNotEmpty  && passwordLoginController.text.isNotEmpty ){
      var resultLogin;
      progressLogin = true;
      usuarioLogin = await dbLogin.getUserDataLogin(emailLoginController.text);
      usuarioLogin.password = passwordLoginController.text;
      if (usuarioLogin != null){
        resultLogin = await dbLogin.logarUsuario(usuarioLogin);
        if (resultLogin == true){
          Modular.to.navigate("/home/");
          Fluttertoast.showToast(msg: 'LOGIN EFETUADO COM SUCESSO', timeInSecForIosWeb:3,backgroundColor: Colors.green);
        } else {
          Fluttertoast.showToast(msg: 'REVISE SUAS CREDENCIAIS', timeInSecForIosWeb:3,backgroundColor: Colors.red);
        }
      }
      progressLogin = false;
    }else{
      Fluttertoast.showToast(msg: 'INFORME SUAS CREDENCIAIS', timeInSecForIosWeb:3);
    }


  }




  @action
  Future<bool> cadastrarUser () async {
    dynamic resultCadastro = false;
    usuario.fullName = fullNameController.text;
    usuario.telefone = phoneController.text;
    usuario.email = emailController.text;
    usuario.password = passwordController.text;
    resultCadastro = await dbLogin.cadastrarUsuario(usuario);
    if (resultCadastro) {
      Modular.to.navigate('/home/');
      print("novo usuario criado com sucesso:${usuario.email}");
      print("---------Sucesso");

    }
    resultCadastro = true;
    return resultCadastro;
  }
}