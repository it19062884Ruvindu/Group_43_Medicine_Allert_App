import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/vaccination/ui/widgets/add_vaccination.dart';
import 'package:our_medicine_alert_43/pages/vaccination/ui/widgets/vaccinationList.dart';

class VaccinationPageBtn extends StatefulWidget {
  final String textOne;
  final String textTwo;
  final bool isEdit;

  const VaccinationPageBtn(
      {Key? key,
      required this.textOne,
      required this.textTwo,
      required this.isEdit})
      : super(key: key);

  @override
  State<VaccinationPageBtn> createState() => _PageVaccinationState();
}

class _PageVaccinationState extends State<VaccinationPageBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 25),
      height: 140,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF00838F),
            borderRadius: BorderRadius.only(
              bottomLeft:
                  !widget.isEdit ? const Radius.circular(80.0) : Radius.zero,
              topRight:
                  widget.isEdit ? const Radius.circular(80.0) : Radius.zero,
            ),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF00838F).withOpacity(0.3),
                  offset: const Offset(-10.0, 0.0),
                  blurRadius: 20.0,
                  spreadRadius: 4.0),
            ]),
        padding: const EdgeInsets.only(
          left: 32,
          top: 40.0,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.textOne,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 2,
            ),
            GestureDetector(
              child: Text(
                widget.textTwo,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                if (!widget.isEdit) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddVaccination()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VaccinationList()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
