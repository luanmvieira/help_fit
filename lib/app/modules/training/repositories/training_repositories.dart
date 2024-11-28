import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hep_fit/app/models/day_training_model.dart';

class TrainingRepositories {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDayTraining(DayTrainingModel dayTraining) async {
    try {
      await _firestore.collection('dayTrainings').doc("${dayTraining.email}_${dayTraining.day}").set(dayTraining.toMap());
      print('Treino salvo com sucesso!');
    } catch (e) {
      print('Erro ao salvar o treino: $e');
    }
  }
  Future<bool> deleteDayTraining(DayTrainingModel dayTraining) async {
    try {
      await _firestore.collection('dayTrainings').doc("${dayTraining.email}_${dayTraining.day}").delete();
      return true;
      print('Treino deletado com sucesso!');
    } catch (e) {
      print('Erro ao deletar o treino: $e');
      return false;
    }
  }
  // Busca treinos filtrados por email e dia da semana
  Future<List<DayTrainingModel>> getTrainingsByEmailAndDay(String email, String day) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('dayTrainings')
          .where('email', isEqualTo: email)
          .where('day', isEqualTo: day)
          .get();
      return querySnapshot.docs.map((doc) {
        return DayTrainingModel.fromMap(doc);
      }).toList();
    } catch (e) {
      print('Erro ao buscar treinos: $e');
      return [];
    }
  }
}
