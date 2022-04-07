import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:our_medicine_alert_43/constants/theme_data.dart';

import 'dosage_list.dart';

class EditDosage extends StatefulWidget {
  DocumentSnapshot docid;
  EditDosage({required this.docid});

  @override
  _EditDosageState createState() => _EditDosageState();
}

class _EditDosageState extends State<EditDosage> {
  final firstDate = DateTime(2021, 1);
  final lastDate = DateTime(2022, 12);

  //editing controller
  TextEditingController medicine = TextEditingController();
  TextEditingController unit = TextEditingController();

  //Set Date and Time to now Date and Time
  DateTime _showDate = DateTime.now();
  TimeOfDay _showTime = TimeOfDay.now();

  @override
  void initState() {
    medicine = TextEditingController(text: widget.docid.get('medicine'));
    unit = TextEditingController(text: widget.docid.get('unit'));
    Timestamp showTimestamp = widget.docid.get('showDate');
    _showDate = DateTime.parse(showTimestamp.toDate().toString());
    _showTime = TimeOfDay.fromDateTime(
        DateTime.parse(showTimestamp.toDate().toString()));
    super.initState();
  }

  //Convert date and time into DateTime Format
  DateTime setDateTime(DateTime showDate, TimeOfDay showTime) {
    return DateTime(showDate.year, showDate.month, showDate.day, showTime.hour,
        showTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00838F),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dosagelist()));
          },
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'medicine': medicine.text,
                'unit': unit.text,
                'showDate': setDateTime(_showDate, _showTime),
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Dosagelist()));
                Fluttertoast.showToast(
                    msg: "Your medication has updated",
                    backgroundColor: Colors.green,
                    textColor: Colors.black,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                    webBgColor: "#25eb1e",
                    timeInSecForIosWeb: 2,
                    toastLength: Toast.LENGTH_LONG);
              });
            },
            child: Text("UPDATE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
          MaterialButton(
            onPressed: () {
              _confirmDelete();
            },
            child: Text("DELETE",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          style: const TextStyle(
                            color: Color(0xFF00838F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          controller: medicine,
                          decoration: const InputDecoration(
                              hintText: 'Medication Name',
                              label: Text('Medication Name')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          style: const TextStyle(
                            color: Color(0xFF00838F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                      //Show Date
                      const Text('Pick Date', style: TextStyle(fontSize: 20)),
                      Text(
                        '$_showDate'.split(' ')[0],
                        style: const TextStyle(fontSize: 25),
                      ),
                      // const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.lock_clock),
                        label: const Text('Medication Date'),
                        onPressed: () => _openDatePicker(context),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      //Show Time
                      const Text('Pick Time', style: TextStyle(fontSize: 20)),
                      Text(
                        '${_showTime.hour}:${_showTime.minute}',
                        style: const TextStyle(fontSize: 25),
                      ),
                      ElevatedButton(
                          onPressed: () => _setTimeForShow(context),
                          child: const Text('Time')),
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

  //Delete Confirm Dialog Box
  Future<void> _confirmDelete() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to delete this?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('You will not be able to revert this action'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                widget.docid.reference.delete().whenComplete(() {
                  Fluttertoast.showToast(
                      msg: "Successfully Deleted!",
                      backgroundColor: Colors.green,
                      textColor: Colors.black,
                      gravity: ToastGravity.BOTTOM_RIGHT,
                      webBgColor: "#25eb1e",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_LONG);
                });
                print('Confirmed');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
