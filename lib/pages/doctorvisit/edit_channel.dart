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

  TextEditingController appointmentType = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientAge = TextEditingController();
  TextEditingController patientMobile = TextEditingController();
  TextEditingController appointmentDate = TextEditingController();
  TextEditingController appointmentDetails = TextEditingController();

  @override
  void initState() {

    appointmentType = TextEditingController(text: widget.docid.get('appointmentType'));
    patientName = TextEditingController(text: widget.docid.get('patientName'));
    patientAge = TextEditingController(text: widget.docid.get('patientAge'));
    patientMobile = TextEditingController(text: widget.docid.get('patientMobile'));
    appointmentDate = TextEditingController(text: widget.docid.get('appointmentDate'));
    appointmentDetails = TextEditingController(text: widget.docid.get('appointmentDetails'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    final AppTypeField = TextFormField(
      autofocus: false,
      controller: appointmentType,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Name");
        }
        return null;
      },
      onSaved: (value) {
    appointmentType.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppNameField = TextFormField(
      autofocus: false,
      controller: patientName ,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Type");
        }
        return null;
      },
      onSaved: (value) {
        patientName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Type(Pill/Tablet/Liquid)",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppAgeField = TextFormField(
      autofocus: false,
      controller: patientAge ,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Brand and Company");
        }
        return null;
      },
      onSaved: (value) {
        patientAge.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Brand/Company",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppMobField = TextFormField(
      autofocus: false,
      controller: patientMobile,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Added Medicine Amount ");
        }
        return null;
      },
      onSaved: (value) {
        patientMobile.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Amount",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppDateField = TextFormField(
      autofocus: false,
      controller: appointmentDate,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter The Expire Date for the Medicines");
        }
        return null;
      },
      onSaved: (value) {
        appointmentDate.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Expire Date",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppcontentField = TextFormField(
      autofocus: false,
      controller: appointmentDetails ,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        appointmentDetails.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.content_paste),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Any Condition",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final EditButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docid.reference.update({
              'appointmentType': appointmentType.text,
              'patientName': patientName.text,
              'patientAge': patientAge.text,
              'patientMobile': patientMobile.text,
              'appointmentDate': appointmentDate.text,
              'appointmentDetails': appointmentDetails.text,

            }).whenComplete(() {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ChannelList()));
            });
          },
          child: Text(
            "Update Appointment",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );



    final DeleteButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red[500],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docid.reference.delete().whenComplete(() {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ChannelList()));
            });
          },
          child: Text(
            "Delete Appointment",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );




    return Scaffold(

      appBar: AppBar(
        title: const Text("Update Appointment"),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),

      backgroundColor: const Color(0xFF00838F),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                //  key: _formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[


                    SizedBox(
                        height: 300,
                        width: 400,
                        child: Image.asset(
                          "assets/Appointment_edit.jpg",
                          fit: BoxFit.contain,
                        )),


                    SizedBox(height: 10),
                    AppTypeField,
                    SizedBox(height: 25),
                    AppNameField,
                    SizedBox(height: 25),
                    AppAgeField,
                    SizedBox(height: 25),
                    AppMobField,
                    SizedBox(height: 25),
                    AppDateField,
                    SizedBox(height: 25),
                    AppcontentField,
                    SizedBox(height: 35),
                    EditButton,
                    SizedBox(height: 15),
                    DeleteButton,
                    SizedBox(height: 15),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
