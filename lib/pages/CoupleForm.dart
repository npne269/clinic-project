import 'package:clinic_app/components/components.dart';
import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:clinic_app/pages/maledetail.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CoupleForm extends StatelessWidget {
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
                errorText: form.fullname.error,
                labelText: 'Full Name',
                onSubmited: (value) {
                  form.fullNameField(value);
                },
              ),
              CustomFormField(
                onSubmited: (value) {
                  form.dateOfBirthField(value);
                },
                errorText: form.dob.error,
                labelText: 'Date of Birth',
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      onSubmited: (value) => form.height = value,
                      errorText: form.height.error,
                      labelText: 'Height in cm',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomFormField(
                      onSubmited: (value) => form.weight = value,
                      errorText: form.weight.error,
                      labelText: 'Weight in cm',
                    ),
                  )
                ],
              ),
              CustomFormField(
                onSubmited: (value) => form.emailField(value),
                errorText: form.email.error,
                labelText: 'Email Address',
              ),
              CustomFormField(
                onSubmited: (value) => form.dateOfBleedField(value),
                errorText: form.dateofbleed.error,
                labelText: 'First Bleeding Date',
              ),
              CustomFormField(
                onSubmited: (value) => form.periodCycle = value,
                errorText: form.periodCycle.error,
                labelText: 'Period Cycle in Day',
              ),
              SizedBox(
                height: 40,
              ),
              BigButton(
                btnPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoupleForm2()));
                },
                btnLabel: 'Continue'.toUpperCase(),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   child: FlatButton(
              //       padding: EdgeInsets.all(15),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       color: pinkColor,
              // onPressed: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => CoupleForm2()));
              // },
              //       child: Text(
              //         'continue'.toUpperCase(),
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 22,
              //             letterSpacing: 1.5,
              //             fontWeight: FontWeight.w600),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
