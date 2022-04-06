import 'package:flutter/material.dart';
import 'myvaccination_home.dart';

class VaccinationSplash extends StatefulWidget {
  const VaccinationSplash({Key? key}) : super(key: key);

  @override
  _VaccinationSplashState createState() => _VaccinationSplashState();
}

class _VaccinationSplashState extends State<VaccinationSplash> {
  @override
  void initState() {
    super.initState();
    navigationSplash();
  }

  navigationSplash() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const VaccinationHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/vax.jpeg",
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Vaccinations',
              style: TextStyle(
                  color: Color(0xFF00838F),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
