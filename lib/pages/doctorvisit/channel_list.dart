import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:our_medicine_alert_43/pages/doctorvisit/edit_channel.dart';
import 'package:our_medicine_alert_43/pages/doctorvisit/add_channel.dart';
import 'package:our_medicine_alert_43/pages/doctorvisit/channel_read.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChannelList extends StatefulWidget {
  const ChannelList({Key? key}) : super(key: key);

  @override
  _ChannelListState createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('appointment').snapshots();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addchannel()));
        },
        child: Icon(
          Icons.add,
        ),
      ),

      appBar: AppBar(
        title: const Text("Appointments"),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Color(0xFF00838F),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),




      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditChannel(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 2,
                          bottom: 2,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.access_alarms_sharp,
                            color: Color(0xFF00838F),
                            size: 50.0,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Color(0xFF00838F),
                            ),
                          ),

                          title: Text(
                            snapshot.data!.docChanges[index].doc['appointmentType'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00838F),
                            ),
                            textAlign: TextAlign.center,
                          ),


                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['appointmentDetails'],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),



                        ),

                      ),

                    ],

                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
