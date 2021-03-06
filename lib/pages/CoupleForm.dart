import 'package:clinic_app/components/components.dart';
import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:clinic_app/pages/maledetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoupleForm extends StatefulWidget {
  @override
  _CoupleFormState createState() => _CoupleFormState();
}

class _CoupleFormState extends State<CoupleForm> {
  final formKey = GlobalKey<FormState>();
  final _dateOfBirth = TextEditingController();
  final _dateOfBleed = TextEditingController();
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _periodCycle = TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _dateOfBirth.dispose();
    _dateOfBleed.dispose();
    _email.dispose();
    _weight.dispose();
    _height.dispose();
    _phoneNumber.dispose();
    _periodCycle.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var form = Provider.of<FormDataProvider>(context);
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
          child: Form(
            key: formKey,
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
                CustomFormField(
                  controller: _fullName,
                  labelText: 'Full Name',
                  hintText: 'Nitesh Neupane',
                ),
                CustomFormField(
                  controller: _dateOfBirth,
                  keyBoardType: TextInputType.datetime,
                  hintText: 'YYYYMMDD',
                  // onSubmited: (String value) {
                  //   print('date is $value');
                  //   form.dateOfBirth = DateTime.parse(value);
                  // },
                  validator: (v) {
                    if (v.isNotEmpty) {
                      if (!(v.length == 8)) {
                        return 'Please Use format YYYYMMDD';
                      } else {
                        return null;
                      }
                    }
                    return 'Please fill the form';
                  },
                  labelText: 'Date of Birth',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        controller: _height,
                        keyBoardType: TextInputType.number,
                        hintText: '145',
                        // onSubmited: (value) {
                        //   form.height = value;
                        // },
                        labelText: 'Height in cm',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomFormField(
                        controller: _weight,
                        keyBoardType: TextInputType.number,
                        hintText: '55',
                        // onSubmited: (value) {
                        //   form.weight = value;
                        //   print('lola ' + value);
                        // },
                        labelText: 'Weight in kg',
                      ),
                    )
                  ],
                ),
                CustomFormField(
                  controller: _email,
                  keyBoardType: TextInputType.emailAddress,
                  hintText: 'hint@gmail.com',
                  validator: (v) {
                    if (!v.contains(RegExp(
                        r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"))) {
                      return 'Please enter valid email';
                    } else {
                      return null;
                    }
                  },
                  // onSubmited: (value) => form.email = (value),
                  labelText: 'Email Address',
                ),
                CustomFormField(
                  controller: _phoneNumber,
                  keyBoardType: TextInputType.phone,
                  hintText: '981xxxxxxx',
                  // onSubmited: (value) {
                  //   form.phoneNumber = value;
                  // },
                  labelText: 'Phone Number',
                ),
                CustomFormField(
                  controller: _dateOfBleed,
                  keyBoardType: TextInputType.datetime,
                  hintText: 'YYYYMMDD',
                  // onSubmited: (value) =>
                  //     form.dateOfBleed = DateTime.parse(value),
                  validator: (v) {
                    if (v.isNotEmpty) {
                      if (!(v.length == 8)) {
                        return 'Please Use format YYYYMMDD';
                      } else {
                        return null;
                      }
                    }
                    return 'Please fill the form';
                  },
                  labelText: 'First Bleeding Date',
                ),
                CustomFormField(
                  controller: _periodCycle,
                  keyBoardType: TextInputType.number,
                  hintText: '28',
                  // onSubmited: (value) => form.periodCycle = value,
                  labelText: 'Period Cycle',
                ),
                SizedBox(
                  height: 20,
                ),
                BigButton(
                  btnPressed: () {
                    if (formKey.currentState.validate()) {
                      Map<String,dynamic> personData = {
                         'name':_fullName.text,
                         'gender':'F',
                         'dob':DateTime.parse(_dateOfBirth.text),
                         'height': double.parse(_height.text),
                         'weight': double.parse(_weight.text),
                         'email':_email.text,
                         'phone':_phoneNumber.text,
                      };
                      form.addPeople(personData);
                      form.dateTimeBleed = DateTime.parse(_dateOfBleed.text);
                      form.periodCycle = _periodCycle.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoupleForm2(),
                        ),
                      );
                    } else {
                      print('something');
                    }
                  },
                  btnLabel: 'Continue'.toUpperCase(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
