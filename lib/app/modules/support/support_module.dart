import 'package:hep_fit/app/modules/support/support_page.dart';
import 'package:hep_fit/app/modules/support/support_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SupportModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(SupportStore.new);
  }


  @override
  void routes(r) {
    r.child('/', child: (context) => const SupportPage());
  }


}