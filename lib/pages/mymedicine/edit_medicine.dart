import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

import 'medicine_list.dart';

class editmedicine extends StatefulWidget {
  DocumentSnapshot docid;
  editmedicine({required this.docid});
  @override
  _editmedicineState createState() => _editmedicineState();
}

class _editmedicineState extends State<editmedicine> {

  TextEditingController medname = TextEditingController();
  TextEditingController medtype = TextEditingController();
  TextEditingController medbrand = TextEditingController();
  TextEditingController medamount = TextEditingController();
  TextEditingController medexpire = TextEditingController();

  TextEditingController content = TextEditingController();

  @override
  void initState() {

    medname = TextEditingController(text: widget.docid.get('medname'));
    medtype = TextEditingController(text: widget.docid.get('medtype'));
    medbrand = TextEditingController(text: widget.docid.get('medbrand'));
    medamount = TextEditingController(text: widget.docid.get('medamount'));
    medexpire = TextEditingController(text: widget.docid.get('medexpire'));
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
                'medname': medname.text,
                'medtype': medtype.text,
                'medbrand': medbrand.text,
                'medamount': medamount.text,
                'medexpire': medexpire.text,
                'content': content.text,

              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => medicinelist()));
              });
            },
            child: Text("Update My Med-Box"),
          ),


          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => medicinelist()));
              });
            },
            child: Text("Delete from My Med-Box"),
          ),

        ],
      ),


      body: Container(
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medname,
                decoration: InputDecoration(
                  hintText: 'Medicine Name',
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medtype,
                decoration: InputDecoration(
                  hintText: 'Medicine Type(Tablet,Pill)',
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medbrand,
                decoration: InputDecoration(
                  hintText: 'Medicine Brand(Company,Brand Name)',
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),



            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medamount,
                decoration: InputDecoration(
                  hintText: 'Medicine Amount(Number of Items)',
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),



            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medexpire,
                decoration: InputDecoration(
                  hintText: 'The Expiry Date of the Items',
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
                    hintText: 'Cautions, Details',
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
