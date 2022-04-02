import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dosage_list.dart';

class AddDosage extends StatelessWidget {
  TextEditingController medicine = TextEditingController();
  TextEditingController unit = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('dosages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      appBar: AppBar(
        title: const Text("Add medication"),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding: const EdgeInsets.only(left: 34.0, right: 34.0,top: 0.0,bottom: 10.0),
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
                const SizedBox(height: 25),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF0D47A1),
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      ref.add({
                        'medicine': medicine.text,
                        'unit': unit.text,
                      }).whenComplete(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Dosagelist()));
                      });
                    },
                    child: const Text(
                      "SAVE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold
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