import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/dosage/add_dosage.dart';
import 'package:our_medicine_alert_43/pages/dosage/dosage_list.dart';
import 'package:our_medicine_alert_43/pages/main/login_page.dart';

class DosageHome extends StatefulWidget {
  const DosageHome({Key? key}) : super(key: key);

  @override
  _DosageHomeState createState() => _DosageHomeState();
}

class _DosageHomeState extends State<DosageHome> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
                color: Color(0xFF363f93),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xFF363f93).withOpacity(0.3),
                    offset: new Offset(-10.0, 10.0),
                    spreadRadius: 4.0,
                    blurRadius: 20.0, // changes position of shadow
                  ),
                ]),
            child: Stack(
              children: [
                Positioned(
                    top: 80,
                    left: 0,
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )),
                Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      "Your Dosages",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF363f93)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 180.0,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: new Offset(-10.0, 10.0),
                                spreadRadius: 4.0,
                                blurRadius: 20.0, // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      left: 30,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/dosage.png"))),
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 200,
                      child: Container(
                        height: 150,
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Medications",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Add new dosage here",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            GestureDetector(
                              child: Text("Click here to add", style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ), ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddDosage()));
                              },
                            )
                          ],
                        ),
                      ))
                ],
              )),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF363f93),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(80.0),
                              ),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFF363f93).withOpacity(0.3),
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0),
                              ]),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Recently added",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              GestureDetector(
                                child: Text("View Medications", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ), ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Dosagelist()));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF363f93),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(80.0),
                              ),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFF363f93).withOpacity(0.3),
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0),
                              ]),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Edit & Remove Medications",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              GestureDetector(
                                child: Text("Change Medications List", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ), ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Dosagelist()));
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
