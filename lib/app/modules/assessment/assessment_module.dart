import 'package:hep_fit/app/modules/assessment/assessment_page.dart';
import 'package:hep_fit/app/modules/assessment/assessment_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/assessment/new_assessment_page.dart';

class AssessmentModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AssessmentStore.new);
  }


  @override
  void routes(r) {
    r.child('/', child: (context) => const AssessmentPage());
    r.child('/newAssessment', child: (context) => const NewAssessmentPage());
  }

}