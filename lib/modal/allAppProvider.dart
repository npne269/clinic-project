import 'dart:collection';
import 'package:clinic_app/modal/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BasicAppDataProvider extends ChangeNotifier {
  List<Map> _clinicData = [
    {
      'title': 'Couples',
      'data': '88',
    },
    {
      'title': 'Years',
      'data': '32',
    },
    {
      'title': 'Clinics',
      'data': '803',
    },
    {
      'title': 'Equiped Members',
      'data': '67',
    },
  ];
  UnmodifiableListView<Map> get clinicData => UnmodifiableListView(_clinicData);
}

class AppointmentDataProvider extends ChangeNotifier {
  DateTime _appointmentDate;
  TimeOfDay _appointmentTimeFrom;
  TimeOfDay _appointmentTimeTo;
  List<String> _dropDownItems = [
    'New work',
    'Damak',
    'Kakadvitta',
    'Rampur',
  ];
  String _coupleTown;

  //all getters
  DateTime get appointmentDate => _appointmentDate;
  TimeOfDay get appointmentTimeFrom => _appointmentTimeFrom;
  TimeOfDay get appointmentTimeTo => _appointmentTimeTo;
  UnmodifiableListView<String> get dropdownItems =>
      UnmodifiableListView(_dropDownItems);
  String get coupleTown => _coupleTown;

  //all setters and methods
  set coupleTown(String data) {
    _coupleTown = data;
    notifyListeners();
  }

  set appointmentDate(DateTime date) {
    _appointmentDate = date;
    notifyListeners();
  }

  set appointmentTimeFrom(TimeOfDay date) {
    _appointmentTimeFrom = date;
    notifyListeners();
  }

  set appointmentTimeTo(TimeOfDay date) {
    _appointmentTimeTo = date;
    notifyListeners();
  }
}

class FormDataProvider extends ChangeNotifier {
  Couple _couple = Couple();
  List<People> _people = [];
  DateTime _dateTimeBleed;
  String _periodCycle;

  set dateTimeBleed(v) {
    _dateTimeBleed = v;
    notifyListeners();
  }

  set periodCycle(v) {
    _periodCycle = v;
    notifyListeners();
  }

  DateTime get dateTimeBleed => _dateTimeBleed;
  String get periodCycle => _periodCycle;
  Couple get couple => _couple;

  void addPeople(Map data) {
    _people.add(People.fromJson(data));
    notifyListeners();
  }

  void saveForm() {
    _couple.couple = _people;
    _couple.bleedingDate = _dateTimeBleed;
    _couple.cycleDay = _periodCycle;
    notifyListeners();
  }
}

// class FormValidator {
//   dynamic value;
//   String error;
//   FormValidator({
//     this.value,
//     this.error,
//   });
// }

// class FormDataProvider extends ChangeNotifier {
// Couple _couple = Couple();
// List<People> _people= [];
// FormValidator _dateOfBirth =
// FormValidator _dateOfBleed =
// FormValidator _fullName =
// FormValidator _email =
// FormValidator _weight =
// FormValidator _height =
// FormValidator _phoneNumber =
// FormValidator _periodCycle =

// FormValidator get dob => _dateOfBirth;
// FormValidator get dateofbleed => _dateOfBleed;
// FormValidator get fullname => _fullName;
// FormValidator get email => _email;
// FormValidator get weight => _weight;
// FormValidator get height => _height;
// FormValidator get phoneNumber => _phoneNumber;
// FormValidator get periodCycle => _periodCycle;
//   bool get isValid {
//     return _email.value != null &&
//             _dateOfBirth != null &&
//             _periodCycle != null &&
//             _dateOfBleed != null &&
//             _fullName != null &&
//             _height != null &&
//             _weight != null
//         ? true
//         : false;
//   }
//   Couple get couple => _couple;

// //setters
//   set height(value){
//     _height = FormValidator(value: value,error: null);
//     notifyListeners();
//   }

//   set weight(value){
//     _weight =FormValidator(value: value,error: null);
//     notifyListeners();
//   }

//   set phoneNumber(value) {
//     print('phoneNumber $value');
//     _phoneNumber = FormValidator(value: value, error: null);
//     notifyListeners();
//   }

//   void periodCycleInput(String value) {
//     print('period cycle $value');
//     _periodCycle = FormValidator(value: value, error: null);
//     notifyListeners();
//   }

//   void dateOfBirthField(String value) {
//     try {
//       DateTime newDate = DateTime.parse(value);
//       // if(newDate.month)
//       _dateOfBirth = FormValidator(value: newDate, error: null);
//     } catch (e) {
//       _dateOfBirth = FormValidator(
//           value: null, error: 'Date format is not valid use YYYYMMDD');
//     }
//     notifyListeners();
//   }

//   void dateOfBleedField(String value) {
//     try {
//       print('In date of bleed field');
//       DateTime newD = DateTime.parse(value);
//       _dateOfBleed = FormValidator(value: newD, error: null);
//     } catch (e) {
//       _dateOfBleed = FormValidator(
//           value: null, error: 'Date format is not valid use YYYYMMDD');
//     }
//     notifyListeners();
//   }

//   void fullNameField(String value) {
//     if (!value.contains(' ')) {
//       _fullName = FormValidator(
//           value: null, error: 'Your fullname should have space in between.');
//     } else {
//       _fullName = FormValidator(value: value, error: null);
//     }
//     notifyListeners();
//   }

//   void emailField(String value) {
// if (!value.contains(
//     RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"))) {
//   _email = FormValidator(value: null, error: 'Please Enter valid email');
// } else {
//   _email = FormValidator(value: value, error: null);
// }
//     notifyListeners();
//   }

//   void addFemale(){
//     _people.add( People(
//         name: _fullName.value,
//         dob: _dateOfBirth.value,
//         email: _email.value,
//         gender: 'F',
//         height: _height.value,
//         weight: _weight.value,
//         phoneNumber: _phoneNumber.value,
//       ));
//       notifyListeners();
//   }

// }

class UploadedDocsProvider extends ChangeNotifier {}
