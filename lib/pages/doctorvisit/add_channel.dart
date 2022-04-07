import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'channel_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class addchannel extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  TextEditingController appointmentType = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientAge = TextEditingController();
  TextEditingController patientMobile = TextEditingController();
  TextEditingController appointmentDate = TextEditingController();
  TextEditingController appointmentDetails = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('appointment');


  @override
  Widget build(BuildContext context) {



    final AppTypeField = TextFormField(
      autofocus: false,
      controller: appointmentType,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Appointment Type");
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
        hintText: "Type(Channel/Report/Surgery)",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppNameField = TextFormField(
      autofocus: false,
      controller: patientName,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Patient Name");
        }
        return null;
      },
      onSaved: (value) {
        patientName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Patient Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppAgeField = TextFormField(
      autofocus: false,
      controller: patientAge,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Patient Age");
        }
        return null;
      },
      onSaved: (value) {
        patientAge.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.align_vertical_bottom_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Patient Age",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppMobField = TextFormField(
      autofocus: false,
      controller: patientMobile,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Patient Mobile Number");
        }
        return null;
      },
      onSaved: (value) {
        patientMobile.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_ic_call_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Patient Mobile Number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppDateField = TextFormField(
      autofocus: false,
      controller: appointmentDate,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter The Appointment Date");
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
        hintText: "Appointment Date",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final AppcontentField = TextFormField(
      autofocus: false,
      controller: appointmentDetails,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        appointmentDetails.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.content_paste),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Appointment Details",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );


    final SubmitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            ref.add({
              'appointmentType': appointmentType.text,
              'patientName': patientName.text,
              'patientAge': patientAge.text,
              'patientMobile': patientMobile.text,
              'appointmentDate': appointmentDate.text,
              'appointmentDetails': appointmentDetails.text,

            }).whenComplete(() {
              Fluttertoast.showToast(
                  msg: "Appointment Successfully Submitted!",
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Color(0xFF00838F),
                  textColor: Colors.white,
                  fontSize: 20.0
              );
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ChannelList()));
            });
          },
          child: Text(
            "Submit Appointment",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );


    return Scaffold(

      appBar: AppBar(
        title: const Text("New Appointment"),
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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[


                    SizedBox(
                        height: 250,
                        width: 400,
                        child: Image.asset(
                          "assets/appointment_add.jpg",
                          fit: BoxFit.contain,
                        )),


                    SizedBox(height: 20),
                    AppTypeField,
                    SizedBox(height: 20),
                    AppNameField,
                    SizedBox(height: 20),
                    AppAgeField,
                    SizedBox(height: 20),
                    AppMobField,
                    SizedBox(height: 20),
                    AppDateField,
                    SizedBox(height: 20),
                    AppcontentField,
                    SizedBox(height: 40),
                    SubmitButton,
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
