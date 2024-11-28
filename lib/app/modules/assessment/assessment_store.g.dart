// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssessmentStore on _AssessmentStoreBase, Store {
  late final _$imagesAtom =
      Atom(name: '_AssessmentStoreBase.images', context: context);

  @override
  ObservableList<XFile> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<XFile> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  late final _$linkDownloadImagesAtom =
      Atom(name: '_AssessmentStoreBase.linkDownloadImages', context: context);

  @override
  ObservableList<String> get linkDownloadImages {
    _$linkDownloadImagesAtom.reportRead();
    return super.linkDownloadImages;
  }

  @override
  set linkDownloadImages(ObservableList<String> value) {
    _$linkDownloadImagesAtom.reportWrite(value, super.linkDownloadImages, () {
      super.linkDownloadImages = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_AssessmentStoreBase.user', context: context);

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

  late final _$currentAssessmentAtom =
      Atom(name: '_AssessmentStoreBase.currentAssessment', context: context);

  @override
  AssessmentModel get currentAssessment {
    _$currentAssessmentAtom.reportRead();
    return super.currentAssessment;
  }

  @override
  set currentAssessment(AssessmentModel value) {
    _$currentAssessmentAtom.reportWrite(value, super.currentAssessment, () {
      super.currentAssessment = value;
    });
  }

  late final _$loadAssessmentAtom =
      Atom(name: '_AssessmentStoreBase.loadAssessment', context: context);

  @override
  bool get loadAssessment {
    _$loadAssessmentAtom.reportRead();
    return super.loadAssessment;
  }

  @override
  set loadAssessment(bool value) {
    _$loadAssessmentAtom.reportWrite(value, super.loadAssessment, () {
      super.loadAssessment = value;
    });
  }

  late final _$loadUserAtom =
      Atom(name: '_AssessmentStoreBase.loadUser', context: context);

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
      AsyncAction('_AssessmentStoreBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$_AssessmentStoreBaseActionController =
      ActionController(name: '_AssessmentStoreBase', context: context);

  @override
  dynamic clearControllers() {
    final _$actionInfo = _$_AssessmentStoreBaseActionController.startAction(
        name: '_AssessmentStoreBase.clearControllers');
    try {
      return super.clearControllers();
    } finally {
      _$_AssessmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPhotoInList(XFile photo) {
    final _$actionInfo = _$_AssessmentStoreBaseActionController.startAction(
        name: '_AssessmentStoreBase.addPhotoInList');
    try {
      return super.addPhotoInList(photo);
    } finally {
      _$_AssessmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images},
linkDownloadImages: ${linkDownloadImages},
user: ${user},
currentAssessment: ${currentAssessment},
loadAssessment: ${loadAssessment},
loadUser: ${loadUser}
    ''';
  }
}
