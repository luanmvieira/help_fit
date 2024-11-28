import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
final LoginStore _controller = Modular.get<LoginStore>();

class LoginPageState extends State<LoginPage> {

  @override
  void dispose() {
    _controller.clearControllers();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.progressLogin?
    Container(
      color: const Color(0xFF3D3D3D),
      child: const SpinKitWave(color: Color(0xFFFFD702), size: 45,),
    )
        :Scaffold(
      backgroundColor: const Color(0xFF3D3D3D),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD702),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  color: Colors.black,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "HELP",
                          style: GoogleFonts.brunoAce(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          )
                      ),
                      TextSpan(
                          text: "FIT",
                          style: GoogleFonts.brunoAce(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection:Axis.vertical ,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.only(top:70,left:40, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                           Text(
                            'Acesse sua conta',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFD702),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _controller.emailLoginController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Login',
                              hintStyle: GoogleFonts.poppins(
                                color: const Color(0xFF3D3D3D),
                                fontSize: 15,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 21),
                          TextField(
                            controller: _controller.passwordLoginController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Senha',
                              hintStyle: GoogleFonts.poppins(
                                color: const Color(0xFF3D3D3D),
                                fontSize: 15,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              await _controller.realizarLogin();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xFFFFD702),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'ENTRAR',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Esqueceu a senha?',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(
                              color:const Color(0xFFFFD702),
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Modular.to.pushNamed('/login/register');
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.yellow,
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'CRIAR CONTA',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFFFFD702),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}