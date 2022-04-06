import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/vaccination/ui/widgets/add_vaccination.dart';
import 'edit_vaccination.dart';

class VaccinationList extends StatefulWidget {
  const VaccinationList({Key? key}) : super(key: key);

  @override
  _VaccinationListState createState() => _VaccinationListState();
}

class _VaccinationListState extends State<VaccinationList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('vaccinations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const AddVaccination()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('My Vaccination'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditVaccination(docId: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot
                                .data!.docChanges[index].doc['vaccinationName'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['lot'],
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
