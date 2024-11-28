import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/repositories/app_repositories.dart';


import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {


  @action
  checkCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        Modular.to.navigate("/home/");
      } else {
        Modular.to.navigate("/login/");
      }
    });

  }

}