import 'package:cloud_firestore/cloud_firestore.dart';

class AssessmentModel {
  String? email;
  List<String>? listPhotos;

  String? coxaD;
  String? coxaE;
  String? panturrilhaD;
  String? panturrilhaE;
  String? antebracoD;
  String? antebracoE;
  String? bracoD;
  String? bracoE;
  String? abdomem;
  String? cintura;
  String? ombro;
  String? torax;
  String? quadril;

  AssessmentModel({
    this.email,
    this.listPhotos,
    this.coxaD,
    this.coxaE,
    this.panturrilhaD,
    this.panturrilhaE,
    this.antebracoD,
    this.antebracoE,
    this.bracoD,
    this.bracoE,
    this.abdomem,
    this.cintura,
    this.ombro,
    this.torax,
    this.quadril,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email ?? '',
      'list_photos': listPhotos ?? [],
      'coxa_direita': coxaD ?? '',
      'coxa_esquerda': coxaE ?? '',
      'panturrilha_direita': panturrilhaD ?? '',
      'panturrilha_esquerda': panturrilhaE ?? '',
      'antebraco_direito': antebracoD ?? '',
      'antebraco_esquerdo': antebracoE ?? '',
      'braco_direito': bracoD ?? '',
      'braco_esquerdo': bracoE ?? '',
      'abdomem': abdomem ?? '',
      'cintura': cintura ?? '',
      'ombro': ombro ?? '',
      'torax': torax ?? '',
      'quadril': quadril ?? '',
    };
  }

  factory AssessmentModel.fromMap(DocumentSnapshot doc) {
    return AssessmentModel(
      email: doc['email'] as String?,
      listPhotos: List<String>.from(doc['list_photos'] ?? []),
      coxaD: doc['coxa_direita'] as String?,
      coxaE: doc['coxa_esquerda'] as String?,
      panturrilhaD: doc['panturrilha_direita'] as String?,
      panturrilhaE: doc['panturrilha_esquerda'] as String?,
      antebracoD: doc['antebraco_direito'] as String?,
      antebracoE: doc['antebraco_esquerdo'] as String?,
      bracoD: doc['braco_direito'] as String?,
      bracoE: doc['braco_esquerdo'] as String?,
      abdomem: doc['abdomem'] as String?,
      cintura: doc['cintura'] as String?,
      ombro: doc['ombro'] as String?,
      torax: doc['torax'] as String?,
      quadril: doc['quadril'] as String?,
    );
  }
}
