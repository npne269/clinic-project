import 'package:clinic_app/components/commonappbar.dart';
import 'package:clinic_app/global.dart';
import 'package:clinic_app/pages/maledetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoupleForm extends StatefulWidget {
  @override
  _CoupleFormState createState() => _CoupleFormState();
}

class _CoupleFormState extends State<CoupleForm> {
  DateTime _dateofbirth;
  DateTime _dateofbleed;
  String _name, _surname, _email, _id;
  double _weight, _height, _periodcycle;
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
                'LADY:',
                style: TextStyle(
                    color: pinkColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type name';
                  }
                  return null;
                },
                onSaved: (input) => _name = input,
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
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type surname';
                  }
                  return null;
                },
                onSaved: (input) => _surname = input,
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
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type height in cm';
                        }
                        return null;
                      },
                      onSaved: (input) => _height = input as double,
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
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type weight in KG';
                        }
                        return null;
                      },
                      onSaved: (input) => _weight = input as double,
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
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type email';
                  }
                  return null;
                },
                onSaved: (input) => _email = input,
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
              InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(Duration(seconds: 2)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2021))
                      .then((date) {
                    setState(() {
                      _dateofbleed = date;
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
                    _dateofbleed == null
                        ? 'First Bleeding Day'
                        : DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(fontSize: 17, color: blueColorLight),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type Cycle period';
                  }
                  return null;
                },
                onSaved: (input) => _periodcycle = input as double,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
                cursorColor: pinkColor,
                decoration: InputDecoration(
                    labelText: 'cycle period',
                    labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
                    focusedBorder: focusborder,
                    enabledBorder: outlineborder),
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
                              builder: (context) => CoupleForm2()));
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
