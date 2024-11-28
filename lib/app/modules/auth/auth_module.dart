import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/auth/auth_init.dart';
import 'package:hep_fit/app/modules/auth/auth_store.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => AuthInit());
  }
}