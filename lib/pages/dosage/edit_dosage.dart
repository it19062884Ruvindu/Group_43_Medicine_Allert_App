import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dosage_list.dart';

class EditDosage extends StatefulWidget {
  DocumentSnapshot docid;
  EditDosage({required this.docid});
  @override
  _EditDosageState createState() => _EditDosageState();
}

class _EditDosageState extends State<EditDosage> {
  TextEditingController medicine = TextEditingController();
  TextEditingController unit = TextEditingController();

  @override
  void initState() {
    medicine = TextEditingController(text: widget.docid.get('medicine'));
    unit = TextEditingController(text: widget.docid.get('unit'));
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
                'medicine': medicine.text,
                'unit': unit.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Dosagelist()));
                Fluttertoast.showToast(msg: "Dosage Details Updated");
              });
            },
            child: Text("UPDATE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Dosagelist()));
                Fluttertoast.showToast(msg: "Dosage Deleted Successfully");
              });
            },
            child: Text("DELETE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 34.0, right: 34.0, top: 0.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25),
                TextFormField(
                  style: const TextStyle(
                    color: Color(0xFF000000),
                  ),
                  controller: medicine,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: "Medicine name",
                    labelStyle: const TextStyle(color: Color(0xFF000000)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF000000),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: TextFormField(
                    controller: unit,
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      labelText: "tablespoon(s)",
                      labelStyle: const TextStyle(color: Color(0xFF000000)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
