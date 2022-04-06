import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/vaccination/ui/widgets/button_menu_page.dart';

import 'widgets/vaccinationList.dart';

class VaccinationHome extends StatefulWidget {
  const VaccinationHome({Key? key}) : super(key: key);

  @override
  _VaccinationHomeState createState() => _VaccinationHomeState();
}

class _VaccinationHomeState extends State<VaccinationHome> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50)),
                color: const Color(0xFF00838F),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF006064).withOpacity(0.3),
                    offset: const Offset(-10.0, 10.0),
                    spreadRadius: 4.0,
                    blurRadius: 20.0, // changes position of shadow
                  ),
                ]),
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    left: 0,
                    child: Container(
                      height: 45,
                      width: 250,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )),
                const Positioned(
                    top: 50,
                    left: 20,
                    child: Text(
                      "My Vaccinations",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00838F)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
              height: 190,
              child: Stack(
                children: [
                  Positioned(
                      top: 25,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 160.0,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 10.0),
                                spreadRadius: 4.0,
                                blurRadius: 20.0, // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      left: 30,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 160,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/vc.jpeg"))),
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 175,
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "On Vaccinations Box Now",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF00838F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            GestureDetector(
                              child: const Text(
                                " The Vaccinations that you have with yourself",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VaccinationList()));
                              },
                            )
                          ],
                        ),
                      ))
                ],
              )),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: const [
                      VaccinationPageBtn(
                        textOne: "Add new",
                        textTwo: "Add Vaccination to the Box",
                        isEdit: false,
                      ),
                      VaccinationPageBtn(
                        textOne: "Edit & remove",
                        textTwo: "Update Vaccination in My Box",
                        isEdit: true,
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
