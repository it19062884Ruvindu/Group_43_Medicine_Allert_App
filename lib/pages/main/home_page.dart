import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/dosage/dosage_list.dart';
import 'package:our_medicine_alert_43/pages/main/login_page.dart';

import '../../model/user_model.dart';
import '../dosage/add_dosage.dart';
import '../mymedicine/medicine_list.dart';
import '../mymedicine/R_Beginning.dart';
import '../doctorvisit/channel_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Med"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              Text(
                "WELCOME TO MY MED",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Dosagelist()));
                      },
                      color: const Color(0xFFFCDAB7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "My Dosages",
                          style: TextStyle(color: Color(0xFF133B5C)),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),


              //Ruvindu's Part Added >>>>
              SizedBox(
                height:5,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RSplash()));
                      },
                      color: const Color(0xFFFCDAB7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "My Medicine Box",
                          style: TextStyle(color: Color(0xFF133B5C)),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),


              //Pubudi's Part Added >>>>
              SizedBox(
                height:5,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => medicinelist())); // Add your Navigation Here
                      },
                      color: const Color(0xFFFCDAB7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "Pubudi's Part",
                          style: TextStyle(color: Color(0xFF133B5C)),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),


              //Yasiru's Part Added >>>>
              SizedBox(
                height:5,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ChannelList())); // Add your Navigation Here
                      },
                      color: const Color(0xFFFCDAB7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "Doctor Visit",
                          style: TextStyle(color: Color(0xFF133B5C)),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),


              SizedBox(
                height: 20,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
