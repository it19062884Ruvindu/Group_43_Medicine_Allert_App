import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/mymedicine/medicine_list.dart';

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>medicinelist())
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
                height: 100,
                child: Image.asset(
                  "assets/r4.png",
                  fit: BoxFit.contain,
                )),

            SizedBox(
              height: 30,
            ),

            Container(
              child: Text(
                'MY MEDICIE LIST',
                style: TextStyle(
                    color: Colors.indigo[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}