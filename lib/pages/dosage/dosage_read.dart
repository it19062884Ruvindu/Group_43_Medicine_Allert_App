import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DosageRead extends StatefulWidget {
  DocumentSnapshot docid;
  DosageRead({required this.docid});

  @override
  _DosageReadState createState() => _DosageReadState();
}

class _DosageReadState extends State<DosageRead> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                    widget.docid.get('title')
                )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  widget.docid.get('content'),
                )
            ),
          )
        ],
      ),
    );
  }
}