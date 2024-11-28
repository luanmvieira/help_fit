import 'package:cloud_firestore/cloud_firestore.dart';

class DayTrainingModel {
  String day;
  String email;
  List<ExerciseModel> exercises;

  DayTrainingModel({
    required this.day,
    required this.email,
    required this.exercises,
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'email': email,
      'exercises': exercises.map((e) => e.toMap()).toList(),
    };
  }

  factory DayTrainingModel.fromMap(DocumentSnapshot doc) {
    return DayTrainingModel(
      day: doc['day'] ?? '',
      email: doc['email'] ?? '',
      exercises: (doc['exercises'] as List<dynamic>)
          .map((e) => ExerciseModel.fromMap(e))
          .toList(),
    );
  }
}

class ExerciseModel {
  String name;
  String sets;
  String reps;
  String breakTime;

  ExerciseModel({
    required this.name,
    required this.sets,
    required this.reps,
    required this.breakTime,
  });

  // Converte o objeto em um Map para salvar no Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'break_time': breakTime,
    };
  }

  // Cria um objeto ExerciseModel a partir de um Map
  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] ?? '',
      sets: map['sets'] ?? 0,
      reps: map['reps'] ?? 0,
      breakTime: map['break_time'],
    );
  }
}
