import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/doctorvisit/add_channel.dart';
import 'package:our_medicine_alert_43/pages/doctorvisit/channel_list.dart';

class ChannelHome extends StatefulWidget {
  const ChannelHome({Key? key}) : super(key: key);

  @override
  _ChannelHomeState createState() => _ChannelHomeState();
}

class _ChannelHomeState extends State<ChannelHome> {

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
                      "My Appointment",
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
              height: 190,
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
                                  image: AssetImage("assets/appointment.jpg"))),
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
                            Text(
                              "On My Appointment",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF00838F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Divider(
                              color: Color(0xFF00838F),
                            ),

                            GestureDetector(
                              child: Text(
                                "Scheduled day and time for an individual to be treated by a physician",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChannelList()));
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
                        height: 140,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),

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
                            bottom: 40,
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Add new",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Add Appointment",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => addchannel()));
                                },
                              )
                            ],
                          ),
                        ),
                      ),


                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 140,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),


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
                            bottom: 40,
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
                                  "Update & Remove Appointment",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChannelList()));
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
