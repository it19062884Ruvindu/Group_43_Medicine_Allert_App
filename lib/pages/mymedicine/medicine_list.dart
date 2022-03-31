import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:our_medicine_alert_43/pages/mymedicine/edit_medicine.dart';
import 'package:our_medicine_alert_43/pages/mymedicine/addmedicine.dart';
import 'package:our_medicine_alert_43/pages/mymedicine/medice_read.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class medicinelist extends StatefulWidget {
  const medicinelist({Key? key}) : super(key: key);

  @override
  _medicinelistState createState() => _medicinelistState();
}

class _medicinelistState extends State<medicinelist> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('medicines').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addmedicine()));
        },
        child: Icon(
          Icons.add,
        ),
      ),

      appBar: AppBar(
        title: Text('My Med'),
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
                            editmedicine(docid: snapshot.data!.docs[index]),
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
                          left: 8,
                          right: 8,
                        ),
                        child: ListTile(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),

                          title: Text(
                            snapshot.data!.docChanges[index].doc['medname'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),

                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['content'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),


                          contentPadding: EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
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


