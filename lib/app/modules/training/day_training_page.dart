import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/models/day_training_model.dart';
import 'package:hep_fit/app/modules/training/training_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hep_fit/app/modules/training/widgets/dialog_new_exercise.dart';

class DayTrainingPage extends StatefulWidget {
  const DayTrainingPage({Key? key}) : super(key: key);

  @override
  DayTrainingPageState createState() => DayTrainingPageState();
}

class DayTrainingPageState extends State<DayTrainingPage> {
  final TrainingStore _controller = Modular.get<TrainingStore>();

  @override
  void initState() {
    super.initState();
    _controller.getDayTrainingByDay();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.loadTrainingDay
            ? Container(
                color: const Color(0xFF3D3D3D),
                child: const SpinKitWave(
                  color: Color(0xFFFFD702),
                  size: 45,
                ),
              )
            : Scaffold(
                floatingActionButton: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xFFFFD702),
                      elevation: 10,
                      child: Icon(Icons.add, color: Colors.black),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogNewExercise();
                            });
                      },
                    ),
                  ),
                ),
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
                                        _controller.user.fullName.split(" ")[0],
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
                                  _controller.currentDay,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 60, right: 60, bottom: 20),
                            child: SingleChildScrollView(
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    child: (_controller
                                                .dayTraining.isNotEmpty &&
                                            _controller.dayTraining[0].exercises
                                                .isNotEmpty)
                                        ? ListView.builder(
                                            itemBuilder: (context, position) {
                                              return cardExercise(_controller
                                                  .dayTraining[0]
                                                  .exercises[position]);
                                            },
                                            itemCount: _controller
                                                .dayTraining[0]
                                                .exercises
                                                .length,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                          )
                                        : Center(
                                            child: Text(
                                              "Não há exercicios cadastrados para esse dia",
                                              style: GoogleFonts.poppins(
                                                color: const Color(0xFFFFD702),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ))))),
                    (_controller.dayTraining.isNotEmpty &&
                            _controller.dayTraining[0].exercises.isNotEmpty)
                        ? Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                await _controller.deleteDayTraining();
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'EXCLUIR DIA DE TREINO',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 20,
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

Widget cardExercise(ExerciseModel exercise) {
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
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  exercise.name,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFFC107),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 55,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD702),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Séries: ${exercise.sets}",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Repetições: ${exercise.reps}",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Descanso: ${exercise.breakTime}",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
