import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/training/training_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class TrainingPage extends StatefulWidget {

  const TrainingPage({Key? key}) : super(key: key);

  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends State<TrainingPage> {
  final TrainingStore _controller = Modular.get<TrainingStore>();

  @override
  void initState() {
    super.initState();
    _controller.getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) =>
        _controller.loadUser ?
        Container(
          color: const Color(0xFF3D3D3D),
          child: const SpinKitWave(color: Color(0xFFFFD702), size: 45,),
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
                                  child: Observer(
                                    builder: (_) =>
                                        Text(
                                          '${_controller.user.fullName.split(
                                              " ")[0]}.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  )
                              ),
                              Image.asset(
                                'assets/images/logo.png',
                                height: 52,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Text(
                            'Treinos',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Segunda-Feira");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Segunda-Feira"),
                            ),

                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Terça-Feira");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Terça-Feira"),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Quarta-Feira");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Quarta-Feira"),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Quinta-Feira");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Quinta-Feira"),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Sexta-Feira");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Sexta-Feira"),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Sábado");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Sábado"),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: () {
                                _controller.setDay("Domingo");
                                Modular.to.pushNamed("/training/daytraining");
                              },
                              child: cardDayTrainning(
                                  'assets/images/image_login.png',
                                  "Domingo"),
                            ),
                          ],
                        ),
                      )
                  )
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

Widget cardDayTrainning(String asset, String day) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Text(
                      day,
                      style: GoogleFonts.poppins(
                        color: Colors.yellow,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      CircleAvatar(
                        radius: 18,
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.yellow,
                      ),
                    ],
                  )
              ),


            ],
          ),
        ),
      ],
    ),
  );
}