import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/assessment/assessment_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AssessmentPage extends StatefulWidget {
  final String title;

  const AssessmentPage({Key? key, this.title = 'AssessmentPage'})
      : super(key: key);

  @override
  AssessmentPageState createState() => AssessmentPageState();
}

class AssessmentPageState extends State<AssessmentPage> {
  final AssessmentStore _controller = Modular.get<AssessmentStore>();

  @override
  void initState() {
    super.initState();
    _controller.getAssessment();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.loadAssessment
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
                        Modular.to.pushNamed("/assessment/newAssessment");
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
                                'Avaliações',
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
                    Observer(
                      builder: (_) => _controller.currentAssessment.email ==
                              null
                          ? Center(
                              child: Text(
                                "Não há avaliação",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFFFD702),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Fotos da Avaliação",
                                          style: GoogleFonts.poppins(
                                            color: Colors.yellow,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Observer(
                                          builder: (_) => _controller
                                                  .linkDownloadImages.isNotEmpty
                                              ? GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                  ),
                                                  itemCount: _controller
                                                      .linkDownloadImages
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                _controller
                                                                        .linkDownloadImages[
                                                                    index]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child: Text(
                                                    "Não há fotos nessa avaliação",
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFD702),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Membros Inferiores - cm",
                                          style: GoogleFonts.poppins(
                                            color: Colors.yellow,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Coxa Medial. D",
                                            Colors.red,
                                            double.parse(_controller
                                                .currentAssessment.coxaD!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Coxa Media. E",
                                            Colors.pink,
                                            double.parse(_controller
                                                .currentAssessment.coxaE!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Panturrilha. D",
                                            Colors.blue,
                                            double.parse(_controller
                                                .currentAssessment
                                                .panturrilhaD!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Panturrilha. E",
                                            Colors.lightBlue,
                                            double.parse(_controller
                                                .currentAssessment
                                                .panturrilhaE!),
                                            100),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Text(
                                          "Membros Superiores - cm",
                                          style: GoogleFonts.poppins(
                                            color: Colors.yellow,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Antebraço. D",
                                            Colors.red,
                                            double.parse(_controller
                                                .currentAssessment.antebracoD!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Antebraço. E",
                                            Colors.orange,
                                            double.parse(_controller
                                                .currentAssessment.antebracoE!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Braço. D",
                                            Colors.blue,
                                            double.parse(_controller
                                                .currentAssessment.bracoD!),
                                            100),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Braço. E",
                                            Colors.lightBlue,
                                            double.parse(_controller
                                                .currentAssessment.bracoE!),
                                            100),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Text(
                                          "Outros Membros - cm",
                                          style: GoogleFonts.poppins(
                                            color: Colors.yellow,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Abdômen",
                                            Colors.red,
                                            double.parse(_controller
                                                .currentAssessment.abdomem!),
                                            150),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Cintura",
                                            Colors.green,
                                            double.parse(_controller
                                                .currentAssessment.cintura!),
                                            150),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Ombro",
                                            Colors.orange,
                                            double.parse(_controller
                                                .currentAssessment.ombro!),
                                            150),
                                      ),
                                      Observer(
                                        builder: (_) => _buildMeasurementRow(
                                            "Tórax",
                                            Colors.purple,
                                            double.parse(_controller
                                                .currentAssessment.torax!),
                                            150),
                                      ),
                                      Observer(
                                          builder: (_) => _buildMeasurementRow(
                                              "Quadril",
                                              Colors.pink,
                                              double.parse(_controller
                                                  .currentAssessment.quadril!),
                                              150)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await _controller
                                                .deleteAssessment();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor: Colors.red,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 12),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            'EXCLUIR AVALIAÇÃO',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ));
  }

  Widget _buildMeasurementRow(
      String label, Color color, double value, double maxValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: LinearProgressIndicator(
              value: value / maxValue,
              color: color,
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value.toString(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
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
