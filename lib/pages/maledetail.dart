import 'package:clinic_app/Screens/coupleDetailPage.dart';
import 'package:clinic_app/components/commonappbar.dart';
import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoupleForm2 extends StatefulWidget {
  @override
  _CoupleForm2State createState() => _CoupleForm2State();
}

class _CoupleForm2State extends State<CoupleForm2> {
  DateTime _dateofbirth;
  DateTime _dateofbleed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(
            title: 'Fill up form',
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 100.0)),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HUSBAND:',
                style: TextStyle(
                    color: pinkColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                cursorColor: pinkColor,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
                    focusedBorder: focusborder,
                    enabledBorder: outlineborder),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                cursorColor: pinkColor,
                decoration: InputDecoration(
                    labelText: 'Surname',
                    labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
                    focusedBorder: focusborder,
                    enabledBorder: outlineborder),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(Duration(seconds: 2)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2021))
                      .then((date) {
                    setState(() {
                      _dateofbirth = date;
                    });
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: pinkColor),
                  ),
                  child: Text(
                    _dateofbirth == null
                        ? 'Date of Birth'
                        : DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(fontSize: 17, color: blueColorLight),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      cursorColor: pinkColor,
                      decoration: InputDecoration(
                          labelText: 'Height in cm',
                          labelStyle:
                              TextStyle(fontSize: 17, color: blueColorLight),
                          focusedBorder: focusborder,
                          enabledBorder: outlineborder),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      cursorColor: pinkColor,
                      decoration: InputDecoration(
                          labelText: 'Weight in KG',
                          labelStyle:
                              TextStyle(fontSize: 17, color: blueColorLight),
                          focusedBorder: focusborder,
                          enabledBorder: outlineborder),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                cursorColor: pinkColor,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
                    focusedBorder: focusborder,
                    enabledBorder: outlineborder),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: pinkColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoupleDetail()));
                    },
                    child: Text(
                      'continue'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
