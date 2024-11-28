
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String fullName;
  String email;
  String telefone;
  String password;


  UserModel({
    this.fullName = '',
    this.email = '',
    this.telefone = '',
    this.password = '',
  }
  );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "full_name" : fullName,
      "email" : email,
      "telefone" : telefone,
    };
    return map;

  }

  factory UserModel.fromMap(DocumentSnapshot doc) {
    return UserModel(
      fullName: doc['full_name'],
      email: doc['email'],
      telefone: doc['telefone'],
    );
  }
}
