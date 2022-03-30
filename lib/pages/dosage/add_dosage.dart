import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dosage_list.dart';

class AddDosage extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('dosages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dosage'),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Dosagelist()));
                Fluttertoast.showToast(msg: "A New Dosage Added");
              });
            },
            child: Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(3, 9, 3, 3),
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'title',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(3, 3, 3, 9),
              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: content,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'content',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
