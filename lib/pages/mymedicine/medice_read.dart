import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicineRead extends StatefulWidget {
  DocumentSnapshot docid;
  MedicineRead({required this.docid});

  @override
  _MedicineReadState createState() => _MedicineReadState();
}

class _MedicineReadState extends State<MedicineRead> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [

          Expanded(
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                    widget.docid.get('medname')
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
                    widget.docid.get('medtype')
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
                    widget.docid.get('medbrand')
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
                    widget.docid.get('medamount')
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
                    widget.docid.get('medexpire')
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