// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$userAtom = Atom(name: 'HomeStoreBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loadUserAtom =
      Atom(name: 'HomeStoreBase.loadUser', context: context);

  @override
  bool get loadUser {
    _$loadUserAtom.reportRead();
    return super.loadUser;
  }

  @override
  set loadUser(bool value) {
    _$loadUserAtom.reportWrite(value, super.loadUser, () {
      super.loadUser = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('HomeStoreBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$logOutUserAsyncAction =
      AsyncAction('HomeStoreBase.logOutUser', context: context);

  @override
  Future<void> logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
loadUser: ${loadUser}
    ''';
  }
}
