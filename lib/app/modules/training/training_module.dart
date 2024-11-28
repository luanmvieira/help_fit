import 'package:hep_fit/app/modules/training/day_training_page.dart';
import 'package:hep_fit/app/modules/training/training_page.dart';
import 'package:hep_fit/app/modules/training/training_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrainingModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(TrainingStore.new);
  }


  @override
  void routes(r) {
    r.child('/', child: (context) => const TrainingPage());
    r.child('/daytraining', child: (context) => const DayTrainingPage());
  }

}