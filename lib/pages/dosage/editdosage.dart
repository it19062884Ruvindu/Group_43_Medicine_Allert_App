import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

import 'dosage_list.dart';

class editdosage extends StatefulWidget {
  DocumentSnapshot docid;
  editdosage({required this.docid});
  @override
  _editdosageState createState() => _editdosageState();
}

class _editdosageState extends State<editdosage> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => dosagelist()));
              });
            },
            child: Text("Update"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => dosagelist()));
              });
            },
            child: Text("delete"),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
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
      ),
    );
  }
}
