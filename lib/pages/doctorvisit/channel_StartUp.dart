import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/doctorvisit/channel_home.dart';

class ChannelStartUp extends StatefulWidget {
  const ChannelStartUp({Key? key}) : super(key: key);

  @override
  _ChannelStartUpState createState() => _ChannelStartUpState();
}

class _ChannelStartUpState extends State<ChannelStartUp> {

  @override
  void initState() {
    super.initState();
    _navigatetoR();
  }

  _navigatetoR() async{
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChannelHome())
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
                height: 400,
                child: Image.asset(
                  "assets/appointment_startUp.jpg",
                  fit: BoxFit.contain,
                )),

            SizedBox(
              height: 30,
            ),

            Container(
              child: Text(
                'Doctor Appointments',
                style: TextStyle(
                    color: Color(0xFF00838F),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
