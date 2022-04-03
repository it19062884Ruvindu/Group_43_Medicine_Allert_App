import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'channel_list.dart';

class addchannel extends StatelessWidget {

  TextEditingController channelName = TextEditingController();
  TextEditingController channelType = TextEditingController();
  TextEditingController channelBrand = TextEditingController();
  TextEditingController channelAmount = TextEditingController();
  TextEditingController channelExpire = TextEditingController();

  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('channels');


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'channelName': channelName.text,
                'channelType': channelType.text,
                'channelBrand': channelBrand.text,
                'channelAmount': channelAmount.text,
                'channelExpire': channelExpire.text,
                'content': content.text,

              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ChannelList()));
              });
            },
            child: Text(
              "Add Channel",
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
                controller: channelName,
                decoration: InputDecoration(
                  hintText: 'Channel Name',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: channelType,
                decoration: InputDecoration(
                  hintText: 'Channel Type',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: channelBrand,
                decoration: InputDecoration(
                  hintText: 'Channel Brand',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: channelAmount,
                decoration: InputDecoration(
                  hintText: 'Channel Amount',
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),


            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: channelExpire,
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
                    hintText: 'Discription',
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
