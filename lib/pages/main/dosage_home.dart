import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/dosage/add_dosage.dart';
import 'package:our_medicine_alert_43/pages/dosage/dosage_list.dart';

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
            height: 120,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
                color: Color(0xFF00838F),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xFF006064).withOpacity(0.3),
                    offset: new Offset(-10.0, 10.0),
                    spreadRadius: 4.0,
                    blurRadius: 20.0, // changes position of shadow
                  ),
                ]),
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    left: 0,
                    child: Container(
                      height: 45,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )),
                Positioned(
                    top: 50,
                    left: 20,
                    child: Text(
                      "My Daily Treatments",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00838F)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                      top: 25,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 160.0,
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
                          height: 160,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/dosage.png"))),
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 175,
                      child: Container(
                        height: 150,
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Text(
                                "All Treatments",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF00838F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dosagelist()));
                              },
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            GestureDetector(
                              child: Text(
                                " Keep track your medications and be reminded on time",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dosagelist()));
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
                        height: 150,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF00838F),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(80.0),
                              ),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFF00838F).withOpacity(0.3),
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0),
                              ]),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 40.0,
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Add to the list",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Add New Treatments",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddDosage()));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 150,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF00838F),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(80.0),
                              ),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFF00838F).withOpacity(0.3),
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0),
                              ]),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 40.0,
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Edit & remove",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Change Treatments List",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dosagelist()));
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
