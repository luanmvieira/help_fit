import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _controller = Modular.get<HomeStore>();


  @override
  void initState() {
    super.initState();
    _controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.loadUser?
        Container(
          color: const Color(0xFF3D3D3D),
          child: const SpinKitWave(color: Color(0xFFFFD702), size: 45,),
        )
    : Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFFFD702),
                elevation: 10,
                child: Icon(Icons.exit_to_app, color: Colors.black),
                onPressed: () async {
                  await _controller.logOutUser();
                },
              ),
            ),
          ),
      backgroundColor: const Color(0xFF3D3D3D),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: 180,
                  color: const Color(0xFFFFD702),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Bem vindo, ${_controller.user.fullName.split(" ")[0]}.',
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
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 150,left: 65, right: 65.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: (){
                      Modular.to.pushNamed("/training/");
                    },
                    child:menuButton(
                        'Treino',
                        'assets/images/training_image.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Modular.to.pushNamed("/assessment/");
                    },
                    child:menuButton(
                      'Avaliação',
                      'assets/images/assessment_image.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Modular.to.pushNamed("/support/");
                    },
                    child:menuButton(
                      'Suporte',
                      'assets/images/support''_image.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }

  Widget menuButton(String title, String asset) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFD702),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
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
