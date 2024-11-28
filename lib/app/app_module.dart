import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/assessment/assessment_module.dart';
import 'package:hep_fit/app/modules/auth/auth_module.dart';
import 'package:hep_fit/app/modules/login/login_module.dart';
import 'package:hep_fit/app/modules/support/support_module.dart';
import 'package:hep_fit/app/modules/training/training_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeModule.new);
  }

  @override
  void routes(r) {
    r.module('/', module: AuthModule());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
    r.module('/training', module: TrainingModule());
    r.module('/assessment', module: AssessmentModule());
    r.module('/support', module: SupportModule());

  }

}