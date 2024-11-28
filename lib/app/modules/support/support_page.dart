import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/assessment/assessment_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hep_fit/app/modules/support/support_store.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({
    Key? key,
  }) : super(key: key);

  @override
  SupportPageState createState() => SupportPageState();
}

class SupportPageState extends State<SupportPage> {
  final SupportStore _controller = Modular.get<SupportStore>();

  @override
  void initState() {
    super.initState();
    _controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.loadUser
            ? Container(
                color: const Color(0xFF3D3D3D),
                child: const SpinKitWave(
                  color: Color(0xFFFFD702),
                  size: 45,
                ),
              )
            : Scaffold(
                backgroundColor: const Color(0xFF3D3D3D),
                appBar: AppBar(
                  backgroundColor: const Color(0xFFFFD702),
                ),
                body: Column(
                  children: [
                    Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            height: 175,
                            color: const Color(0xFFFFD702),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      "${_controller.user.fullName.split(" ")[0]}.",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/logo.png',
                                    height: 52,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Text(
                                'Suporte',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cardSupport("João Vitor","(38) 99245-9715",'assets/images/support_Joao.jpg' ),
                              cardSupport("Gabriel Rodrigues","(38) 99134-9884",'assets/images/support_Gabriel.jpg'),
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width * 0.4, // Ponto de controle X
      size.height + 20, // Ponto de controle Y
      size.width, // Ponto final X
      size.height - 80, // Ponto final Y
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget cardSupport(String name, String phone, String asset) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      asset,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),

                const SizedBox(width: 30),
                Container(
                  height: 90,
                  width: 200,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Telefone: $phone",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
