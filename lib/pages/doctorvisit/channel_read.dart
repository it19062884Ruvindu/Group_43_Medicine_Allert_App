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
                    widget.docid.get('channelName')
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
                    widget.docid.get('channelType')
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
                    widget.docid.get('channelBrand')
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
                    widget.docid.get('channelAmount')
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
                    widget.docid.get('channelExpire')
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
