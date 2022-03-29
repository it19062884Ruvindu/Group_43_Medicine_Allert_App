import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'medicine_list.dart';

class addmedicine extends StatelessWidget {
  TextEditingController medname = TextEditingController();
  TextEditingController medtype = TextEditingController();
  TextEditingController medbrand = TextEditingController();
  TextEditingController medamount = TextEditingController();
  TextEditingController medexpire = TextEditingController();

  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('medicines');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
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
            child: Text(
              "Add Medicine",
            ),
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
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medtype,
                decoration: InputDecoration(
                  hintText: 'Medicine Type (Tablet,Liquid,Pill)',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medbrand,
                decoration: InputDecoration(
                  hintText: 'Medicine Brand (Compnay,Brand)',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medamount,
                decoration: InputDecoration(
                  hintText: 'Medicine Amount (Number of Items)',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: medexpire,
                decoration: InputDecoration(
                  hintText: 'Expire Date of the Items(MM/DD/YY)',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Discription (Cautions)',
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
