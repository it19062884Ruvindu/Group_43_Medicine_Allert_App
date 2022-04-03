import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'channel_list.dart';

class EditChannel extends StatefulWidget {
  DocumentSnapshot docid;
  EditChannel({required this.docid});

  @override
  State<EditChannel> createState() => _EditChannelState();
}

class _EditChannelState extends State<EditChannel> {

  TextEditingController channelName = TextEditingController();
  TextEditingController channelType = TextEditingController();
  TextEditingController channelBrand = TextEditingController();
  TextEditingController channelAmount = TextEditingController();
  TextEditingController channelExpire = TextEditingController();

  TextEditingController content = TextEditingController();

  @override
  void initState() {

    channelName = TextEditingController(text: widget.docid.get('channelName'));
    channelType = TextEditingController(text: widget.docid.get('channelType'));
    channelBrand = TextEditingController(text: widget.docid.get('channelBrand'));
    channelAmount = TextEditingController(text: widget.docid.get('channelAmount'));
    channelExpire = TextEditingController(text: widget.docid.get('channelExpire'));
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
            child: Text("Update My Channel"),
          ),


          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ChannelList()));
              });
            },
            child: Text("Delete from My Channel"),
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
              height: 10,
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
              height: 10,
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
              height: 10,
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
              height: 10,
            ),



            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: channelExpire,
                decoration: InputDecoration(
                  hintText: 'Channel Expire',
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
