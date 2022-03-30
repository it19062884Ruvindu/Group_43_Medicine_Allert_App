import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:our_medicine_alert_43/pages/dosage/dosage_list.dart';
import 'package:our_medicine_alert_43/pages/main/dosage_home.dart';

class AnimationWelcome extends StatefulWidget {
  const AnimationWelcome({Key? key}) : super(key: key);

  @override
  _AnimationWelcomeState createState() => _AnimationWelcomeState();
}

class _AnimationWelcomeState extends State<AnimationWelcome> {
  @override
  void initState() {
    super.initState();
    _navigatetoDosage();
  }

  _navigatetoDosage() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DosageHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_IsgQP9.json'),
      ),
    );
  }
}
