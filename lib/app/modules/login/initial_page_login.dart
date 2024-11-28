import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class InitialPageLogin extends StatefulWidget {

  const InitialPageLogin({Key? key}) : super(key: key);
  @override
  InitialPageLoginState createState() => InitialPageLoginState();
}
class InitialPageLoginState extends State<InitialPageLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagem de fundo
          Image.asset(
            'assets/images/image_login.png',
            fit: BoxFit.cover,
          ),
          // Gradiente escuro para contraste
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'HELPFIT',
                          style: GoogleFonts.brunoAce(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:  const Color(0xFFFFD702),
                            letterSpacing: 1.5,
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD702),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Modular.to.navigate("/login/login");

                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'LOGIN',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}