import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hep_fit/app/modules/assessment/assessment_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewAssessmentPage extends StatefulWidget {
  const NewAssessmentPage({Key? key}) : super(key: key);

  @override
  NewAssessmentPageState createState() => NewAssessmentPageState();
}

class NewAssessmentPageState extends State<NewAssessmentPage> {
  final AssessmentStore _controller = Modular.get<AssessmentStore>();
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    _controller.clearControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Avaliação',
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
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 0, left: 40, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Membros inferiores - cm',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFD702),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _controller.cxMEController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Coxa Medial.D',
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
                            controller: _controller.cxMDController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Coxa Medial. E',
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
                            controller: _controller.ptDController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Panturrilha. D',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.ptEController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Panturrilha. E',
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
                          const SizedBox(height: 20),
                          Text(
                            'Membros Superiores - cm',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFD702),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _controller.antDController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Antebraço.D',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.antEController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Antebraço.E',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.brcDController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Braço. D',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.brcEController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Braço. E',
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
                          const SizedBox(height: 20),
                          Text(
                            'Outros Membros - cm',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFD702),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _controller.abdController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Abdômen',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.cntController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Cintura',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.ombController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Ombro',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.trxController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Tórax',
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
                            keyboardType: TextInputType.number,
                            controller: _controller.qdrController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Quadril',
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
                          const SizedBox(height: 20),
                          Text(
                            'Fotos',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFD702),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Observer(
                              builder: (_) => SizedBox(
                                    height: 100,
                                    child: _controller.images.isNotEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                _controller.images.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Image.file(
                                                  File(_controller
                                                      .images[index].path),
                                                  fit: BoxFit.cover,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              );
                                            },
                                          )
                                        : const Center(
                                            child: Text(
                                              'Nenhuma imagem a ser exibida',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                  )),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              final XFile? photo = await picker.pickImage(
                                  source: ImageSource.camera);
                              _controller.addPhotoInList(photo!);
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
                              'ADICIONAR FOTOS',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await _controller.sendNewAssessment();
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
                              'CADASTRAR',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
