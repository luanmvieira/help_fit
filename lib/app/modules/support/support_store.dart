import 'package:hep_fit/app/models/user_model.dart';
import 'package:hep_fit/app/repositories/app_repositories.dart';
import 'package:mobx/mobx.dart';

part 'support_store.g.dart';

class SupportStore = _SupportStoreBase with _$SupportStore;
abstract class _SupportStoreBase with Store {

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
}