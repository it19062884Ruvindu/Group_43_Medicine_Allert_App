import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_medicine_alert_43/pages/dosage/edit_dosage.dart';
import 'package:our_medicine_alert_43/pages/dosage/add_dosage.dart';
import 'package:flutter/material.dart';

class Dosagelist extends StatefulWidget {
  const Dosagelist({Key? key}) : super(key: key);

  @override
  _DosagelistState createState() => _DosagelistState();
}

class _DosagelistState extends State<Dosagelist> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('dosages').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AddDosage()));
        },
        child: Row(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(Icons.add),
            Text(
              "ADD",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00838F),
        centerTitle: true,
        title: const Text("My Treatments"),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        //backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: () {
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
                Timestamp showDate =
                snapshot.data!.docChanges[index].doc['showDate'];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditDosage(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 7,
                          bottom: 10,
                        ),
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            title: Text(snapshot
                                .data!.docChanges[index].doc['medicine'] +
                                " - " +
                                DateTime.parse(showDate.toDate().toString())
                                    .toString()
                                    .split(' ')[0]),
                            subtitle: Text(
                                snapshot.data!.docChanges[index].doc['unit']),
                            leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://unsplash.com/photos/kfJkpeI6Lgc")),
                            trailing: Wrap(
                              spacing: 12,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.notifications,
                                        color: Colors.red),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => EditDosage(
                                                  docid: snapshot
                                                      .data!.docs[index])));
                                    }),
                                IconButton(
                                  icon: Icon(Icons.edit
                                    // ,
                                    // color: _subscribed == true
                                    //     ? Colors.red
                                    //     : Colors.grey
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => EditDosage(
                                                docid: snapshot
                                                    .data!.docs[index])));
                                  },
                                ),
                              ],
                            )),
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
