import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hep_fit/app/modules/training/training_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DialogNewExercise extends StatefulWidget {
  @override
  _DialogNewExerciseState createState() => _DialogNewExerciseState();
}

class _DialogNewExerciseState extends State<DialogNewExercise> {
  final TrainingStore _controller = Modular.get<TrainingStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.clearControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content: Observer(
        builder: (context) {
          return _controller.loadSendNewExercise
              ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.60,
            child: const Center(
              child: SpinKitWave(
                color: Color(0xff1F1F30),
                size: 50,
              ),
            ),
          )
              : SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.80,
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Informações sobre o exercício a ser adicionado",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3D3D3D),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _controller.nameExerciseController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nome',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _controller.setsExerciseController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Séries',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _controller.repsExerciseController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Repetições',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _controller.breakTimeExerciseController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tempo de descanso',
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
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD702),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      await _controller.addExerciseInTraining();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Adicionar Exercício',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
