import 'package:hep_fit/app/modules/login/login_page.dart';
import 'package:hep_fit/app/modules/login/initial_page_login.dart';
import 'package:hep_fit/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/login/register_page.dart';

class LoginModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(LoginStore.new);
  }


  @override
  void routes(r) {
    r.child('/', child: (context) => const InitialPageLogin());
    r.child('/login', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
  }

}