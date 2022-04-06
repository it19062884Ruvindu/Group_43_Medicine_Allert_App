import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/mymedicine/mymedcine_home.dart';

class RSplash extends StatefulWidget {
  const RSplash({Key? key}) : super(key: key);

  @override
  _RSplashState createState() => _RSplashState();
}

class _RSplashState extends State<RSplash> {
  @override
  void initState() {
    super.initState();
    _navigatetoR();
  }

  _navigatetoR() async{
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MedicineHome())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/r6.png",
                  fit: BoxFit.contain,
                )),

            SizedBox(
              height: 30,
            ),

            Container(
              child: Text(
                'MY MEDICINE LIST',
                style: TextStyle(
                    color: Color(0xFF00838F),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}