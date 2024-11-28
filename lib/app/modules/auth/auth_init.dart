import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hep_fit/app/modules/auth/auth_store.dart';


class AuthInit extends StatefulWidget {
  @override AuthInitState createState() => AuthInitState();
}

class AuthInitState extends State<AuthInit> {
  final AuthStore controller = Modular.get<AuthStore>();
  @override
  void initState() {
    controller.checkCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF3D3D3D),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: SpinKitWave(color: Colors.white, size: 45,))
            ],
          ),
        )
    );
  }
}
