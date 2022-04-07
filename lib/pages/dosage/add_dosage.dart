import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dosage_list.dart';

class AddDosage extends StatefulWidget {
  AddDosage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _AddDosageState();
}

class _AddDosageState extends State<AddDosage> {
  final firstDate = DateTime(2021, 1);
  final lastDate = DateTime(2022, 12);

  //editing controller
  TextEditingController medicine = TextEditingController();
  TextEditingController unit = TextEditingController();
  DateTime _showDate = DateTime.now();
  TimeOfDay _showTime = TimeOfDay.now();

  // firebase database
  CollectionReference ref = FirebaseFirestore.instance.collection('dosages');

  //Convert date and time into DateTime Format
  DateTime setDateTime(DateTime showDate, TimeOfDay showTime) {
    return DateTime(showDate.year, showDate.month, showDate.day, showTime.hour,
        showTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00838F),
      appBar: AppBar(
        title: const Text("Add medication"),
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
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(children: [
                      Container(
                          child: TextField(
                        style: const TextStyle(
                          color: Color(0xFF00838F),
                          fontWeight: FontWeight.bold,
                        ),
                        controller: medicine,
                        decoration: const InputDecoration(
                            hintText: 'Medication Name',
                            label: Text('Medication Name')),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          style: const TextStyle(
                            color: Color(0xFF00838F),
                            fontWeight: FontWeight.bold,
                          ),
                          controller: unit,
                          decoration: const InputDecoration(
                              hintText: 'Pill(s) / Tablespoon(s)',
                              label: Text('Unit')),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Pick Date', style: TextStyle(fontSize: 15)),
                      Text(
                        '$_showDate'.split(' ')[0],
                        style: const TextStyle(fontSize: 25),
                      ),
                      // const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.lock_clock),
                        label: const Text('Medication Date'),
                        onPressed: () => _openDatePicker(context),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      const Text('Pick Time', style: TextStyle(fontSize: 20)),
                      Text(
                        '${_showTime.hour}:${_showTime.minute}',
                        style: const TextStyle(fontSize: 25),
                      ),
                      ElevatedButton(
                          onPressed: () => _setTimeForShow(context),
                          child: const Text('Time')),

                      const SizedBox(height: 65),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF00838F),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            ref.add({
                              'medicine': medicine.text,
                              'unit': unit.text,
                              'showDate': setDateTime(_showDate, _showTime),
                            }).whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Dosagelist()));
                              Fluttertoast.showToast(
                                  msg: "New medication added",
                                  backgroundColor: Colors.green,
                                  textColor: Colors.black,
                                  gravity: ToastGravity.BOTTOM_RIGHT,
                                  webBgColor: "#25eb1e",
                                  timeInSecForIosWeb: 2,
                                  toastLength: Toast.LENGTH_LONG);
                            });
                          },
                          child: const Text(
                            "SAVE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//Date Picker
  _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _showDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (date == null) {
      print("No Date Selected");
    } else {
      print(date);
      setState(() {
        _showDate = date;
      });
    }
  }

//Time Picker
  _setTimeForShow(BuildContext context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: _showTime);
    if (time == null) {
      print("No Time Selected");
    } else {
      print(_showTime);
      setState(() {
        _showTime = time;
      });
    }
  }
}
