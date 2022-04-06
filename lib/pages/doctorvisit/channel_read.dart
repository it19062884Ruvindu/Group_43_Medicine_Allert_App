import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChannelRead extends StatefulWidget {
  DocumentSnapshot docid;
  ChannelRead({required this.docid});

  @override
  State<ChannelRead> createState() => _ChannelReadState();
}

class _ChannelReadState extends State<ChannelRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [

          Expanded(
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                    widget.docid.get('appointmentType')
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
                    widget.docid.get('patientName')
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
                    widget.docid.get('patientAge')
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
                    widget.docid.get('patientMobile')
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
                    widget.docid.get('appointmentDate')
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
                  widget.docid.get('appointmentDetails'),
                )
            ),
          )


        ],
      ),
    );
  }
}
