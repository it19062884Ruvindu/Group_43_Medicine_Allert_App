import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/vaccination/ui/widgets/vaccinationList.dart';

class EditVaccination extends StatefulWidget {
  final DocumentSnapshot docId;

  const EditVaccination({Key? key, required this.docId}) : super(key: key);
  @override
  _EditVaccinationState createState() => _EditVaccinationState();
}

class _EditVaccinationState extends State<EditVaccination> {
  TextEditingController vaccinationName = TextEditingController();

  TextEditingController lotCtrl = TextEditingController();

  TextEditingController dateReceivedCtrl = TextEditingController();

  TextEditingController receivedFrom = TextEditingController();

  TextEditingController helProSingCtrl = TextEditingController();

  @override
  void initState() {
    vaccinationName =
        TextEditingController(text: widget.docId.get('vaccinationName'));
    lotCtrl = TextEditingController(text: widget.docId.get('lot'));
    dateReceivedCtrl =
        TextEditingController(text: widget.docId.get('dateReceived'));
    receivedFrom =
        TextEditingController(text: widget.docId.get('receivedFrom'));
    helProSingCtrl =
        TextEditingController(text: widget.docId.get('helProSing'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vaccineField = TextFormField(
      autofocus: false,
      controller: vaccinationName,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Vaccine Name");
        }
        return null;
      },
      onSaved: (value) {
        vaccinationName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Vaccine Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final lotField = TextFormField(
      autofocus: false,
      controller: lotCtrl,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Vaccine lot number");
        }
        return null;
      },
      onSaved: (value) {
        lotCtrl.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Lot#",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final dateReceivedField = TextFormField(
      autofocus: false,
      controller: dateReceivedCtrl,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter vaccine received date");
        }
        return null;
      },
      onSaved: (value) {
        dateReceivedCtrl.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Date received",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final receivedFromField = TextFormField(
      autofocus: false,
      controller: receivedFrom,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter the vaccination center name");
        }
        return null;
      },
      onSaved: (value) {
        receivedFrom.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Received from",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final helProSingField = TextFormField(
      autofocus: false,
      maxLines: 3,
      controller: helProSingCtrl,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter The Health provider signature");
        }
        return null;
      },
      onSaved: (value) {
        helProSingCtrl.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Health provider signature",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final editButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docId.reference.update({
              'vaccinationName': vaccinationName.text,
              'lot': lotCtrl.text,
              'dateReceived': dateReceivedCtrl.text,
              'receivedFrom': receivedFrom.text,
              'helProSing': helProSingCtrl.text,
            }).whenComplete(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const VaccinationList()));
            });
          },
          child: const Text(
            "Update My Vaccination",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final deleteButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docId.reference.delete().whenComplete(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const VaccinationList()));
            });
          },
          child: const Text(
            "Delete from My Vaccination",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Medicine"),
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
          onPressed: () {
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
                        height: 130,
                        width: 100,
                        child: Image.asset(
                          "assets/vc.jpeg",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 30),
                    vaccineField,
                    const SizedBox(height: 25),
                    lotField,
                    const SizedBox(height: 25),
                    dateReceivedField,
                    const SizedBox(height: 25),
                    receivedFromField,
                    const SizedBox(height: 25),
                    helProSingField,
                    const SizedBox(height: 35),
                    editButton,
                    const SizedBox(height: 15),
                    deleteButton,
                    const SizedBox(height: 15),
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
