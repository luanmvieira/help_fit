// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TrainingStore on _TrainingStoreBase, Store {
  late final _$userAtom =
      Atom(name: '_TrainingStoreBase.user', context: context);

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

  late final _$dayTrainingAtom =
      Atom(name: '_TrainingStoreBase.dayTraining', context: context);

  @override
  List<DayTrainingModel> get dayTraining {
    _$dayTrainingAtom.reportRead();
    return super.dayTraining;
  }

  @override
  set dayTraining(List<DayTrainingModel> value) {
    _$dayTrainingAtom.reportWrite(value, super.dayTraining, () {
      super.dayTraining = value;
    });
  }

  late final _$loadUserAtom =
      Atom(name: '_TrainingStoreBase.loadUser', context: context);

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

  late final _$loadTrainingDayAtom =
      Atom(name: '_TrainingStoreBase.loadTrainingDay', context: context);

  @override
  bool get loadTrainingDay {
    _$loadTrainingDayAtom.reportRead();
    return super.loadTrainingDay;
  }

  @override
  set loadTrainingDay(bool value) {
    _$loadTrainingDayAtom.reportWrite(value, super.loadTrainingDay, () {
      super.loadTrainingDay = value;
    });
  }

  late final _$loadSendNewExerciseAtom =
      Atom(name: '_TrainingStoreBase.loadSendNewExercise', context: context);

  @override
  bool get loadSendNewExercise {
    _$loadSendNewExerciseAtom.reportRead();
    return super.loadSendNewExercise;
  }

  @override
  set loadSendNewExercise(bool value) {
    _$loadSendNewExerciseAtom.reportWrite(value, super.loadSendNewExercise, () {
      super.loadSendNewExercise = value;
    });
  }

  late final _$currentDayAtom =
      Atom(name: '_TrainingStoreBase.currentDay', context: context);

  @override
  String get currentDay {
    _$currentDayAtom.reportRead();
    return super.currentDay;
  }

  @override
  set currentDay(String value) {
    _$currentDayAtom.reportWrite(value, super.currentDay, () {
      super.currentDay = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_TrainingStoreBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$deleteDayTrainingAsyncAction =
      AsyncAction('_TrainingStoreBase.deleteDayTraining', context: context);

  @override
  Future deleteDayTraining() {
    return _$deleteDayTrainingAsyncAction.run(() => super.deleteDayTraining());
  }

  late final _$getDayTrainingByDayAsyncAction =
      AsyncAction('_TrainingStoreBase.getDayTrainingByDay', context: context);

  @override
  Future getDayTrainingByDay() {
    return _$getDayTrainingByDayAsyncAction
        .run(() => super.getDayTrainingByDay());
  }

  late final _$_TrainingStoreBaseActionController =
      ActionController(name: '_TrainingStoreBase', context: context);

  @override
  dynamic setDay(String day) {
    final _$actionInfo = _$_TrainingStoreBaseActionController.startAction(
        name: '_TrainingStoreBase.setDay');
    try {
      return super.setDay(day);
    } finally {
      _$_TrainingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearDayTraining() {
    final _$actionInfo = _$_TrainingStoreBaseActionController.startAction(
        name: '_TrainingStoreBase.clearDayTraining');
    try {
      return super.clearDayTraining();
    } finally {
      _$_TrainingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearControllers() {
    final _$actionInfo = _$_TrainingStoreBaseActionController.startAction(
        name: '_TrainingStoreBase.clearControllers');
    try {
      return super.clearControllers();
    } finally {
      _$_TrainingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
dayTraining: ${dayTraining},
loadUser: ${loadUser},
loadTrainingDay: ${loadTrainingDay},
loadSendNewExercise: ${loadSendNewExercise},
currentDay: ${currentDay}
    ''';
  }
}
