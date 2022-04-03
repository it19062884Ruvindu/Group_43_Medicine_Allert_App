import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import 'package:flutter/material.dart';
import 'medicine_list.dart';

class editmedicine extends StatefulWidget {

  //form key
  final _formKey2 = GlobalKey<FormState>();

  DocumentSnapshot docid;
  editmedicine({required this.docid});
  @override
  _editmedicineState createState() => _editmedicineState();
}

class _editmedicineState extends State<editmedicine> {

  TextEditingController medname = TextEditingController();
  TextEditingController medtype = TextEditingController();
  TextEditingController medbrand = TextEditingController();
  TextEditingController medamount = TextEditingController();
  TextEditingController medexpire = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {

    medname = TextEditingController(text: widget.docid.get('medname'));
    medtype = TextEditingController(text: widget.docid.get('medtype'));
    medbrand = TextEditingController(text: widget.docid.get('medbrand'));
    medamount = TextEditingController(text: widget.docid.get('medamount'));
    medexpire = TextEditingController(text: widget.docid.get('medexpire'));
    content = TextEditingController(text: widget.docid.get('content'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    final MedNameField = TextFormField(
      autofocus: false,
      controller: medname,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Name");
        }
        return null;
      },
      onSaved: (value) {
        medname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final MedTypeField = TextFormField(
      autofocus: false,
      controller: medtype,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Type");
        }
        return null;
      },
      onSaved: (value) {
        medtype.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Type(Pill/Tablet/Liquid)",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final MedBrandField = TextFormField(
      autofocus: false,
      controller: medbrand,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter New Medicine Brand and Company");
        }
        return null;
      },
      onSaved: (value) {
        medbrand.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Brand/Company",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final MedAmountField = TextFormField(
      autofocus: false,
      controller: medamount,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Added Medicine Amount ");
        }
        return null;
      },
      onSaved: (value) {
        medamount.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wallet_travel_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Medicine Amount",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final MedExpireField = TextFormField(
      autofocus: false,
      controller: medexpire,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter The Expire Date for the Medicines");
        }
        return null;
      },
      onSaved: (value) {
        medexpire.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Expire Date",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final MedcontentField = TextFormField(
      autofocus: false,
      controller: content,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        content.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.content_paste),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Any Condition",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );



    final EditButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docid.reference.update({
              'medname': medname.text,
              'medtype': medtype.text,
              'medbrand': medbrand.text,
              'medamount': medamount.text,
              'medexpire': medexpire.text,
              'content': content.text,

            }).whenComplete(() {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => medicinelist()));
            });
          },
          child: Text(
            "Update My Med-Box",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );



    final DeleteButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red[500],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            widget.docid.reference.delete().whenComplete(() {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => medicinelist()));
            });
          },
          child: Text(
            "Delete from My Med-Box",
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
              //  key: _formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[


                    SizedBox(
                        height: 130,
                        width: 100,
                        child: Image.asset(
                          "assets/r6.png",
                          fit: BoxFit.contain,
                        )),


                    SizedBox(height: 10),
                    MedNameField,
                    SizedBox(height: 25),
                    MedTypeField,
                    SizedBox(height: 25),
                    MedBrandField,
                    SizedBox(height: 25),
                    MedAmountField,
                    SizedBox(height: 25),
                    MedExpireField,
                    SizedBox(height: 25),
                    MedcontentField,
                    SizedBox(height: 35),
                    EditButton,
                    SizedBox(height: 15),
                    DeleteButton,
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
