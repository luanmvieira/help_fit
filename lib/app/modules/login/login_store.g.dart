// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$usuarioLoginAtom =
      Atom(name: '_LoginStoreBase.usuarioLogin', context: context);

  @override
  UserModel get usuarioLogin {
    _$usuarioLoginAtom.reportRead();
    return super.usuarioLogin;
  }

  @override
  set usuarioLogin(UserModel value) {
    _$usuarioLoginAtom.reportWrite(value, super.usuarioLogin, () {
      super.usuarioLogin = value;
    });
  }

  late final _$progressLoginAtom =
      Atom(name: '_LoginStoreBase.progressLogin', context: context);

  @override
  bool get progressLogin {
    _$progressLoginAtom.reportRead();
    return super.progressLogin;
  }

  @override
  set progressLogin(bool value) {
    _$progressLoginAtom.reportWrite(value, super.progressLogin, () {
      super.progressLogin = value;
    });
  }

  late final _$realizarLoginAsyncAction =
      AsyncAction('_LoginStoreBase.realizarLogin', context: context);

  @override
  Future<dynamic> realizarLogin() {
    return _$realizarLoginAsyncAction.run(() => super.realizarLogin());
  }

  late final _$cadastrarUserAsyncAction =
      AsyncAction('_LoginStoreBase.cadastrarUser', context: context);

  @override
  Future<bool> cadastrarUser() {
    return _$cadastrarUserAsyncAction.run(() => super.cadastrarUser());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic clearControllers() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.clearControllers');
    try {
      return super.clearControllers();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogin: ${usuarioLogin},
progressLogin: ${progressLogin}
    ''';
  }
}
