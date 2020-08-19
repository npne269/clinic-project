import 'package:clinic_app/components/datePicker.dart';
import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopArea(),
          Center(
            child: Container(
              height: 100,
              child: DatePicker(
                initialDate: DateTime.now(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopArea extends StatefulWidget {
  @override
  _TopAreaState createState() => _TopAreaState();
}

class _TopAreaState extends State<TopArea> {
  final List<Map> _clinicData = [
    {
      'title': 'Couples',
      'data': '12345',
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
  List<String> _dropDownValue = [
    'New work',
    'Damak',
    'Kakadvitta',
    'Rampur',
  ];
  String _value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left:10,top:MediaQuery.of(context).padding.top,),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [blueColorDark, blueColorLight],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fertility Clinic Network',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: blueColorLight),
                ),
                Text(
                  'Book your first appointment',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.maxFinite,
                  color: backgroundColor,
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconSize: 40,
                        iconEnabledColor: blueColorLight,
                        style: TextStyle(
                          color: pinkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        hint: Text('Select Town',style: TextStyle(
                          color: pinkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                        items: _dropDownValue.map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        ).toList(),
                        onChanged: (String value) {
                          setState(() {
                            _value = value;
                          });
                          print(_value);
                        },
                        value: _value,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: List.generate(5, (i) {
              return (i == 0)
                  ? SizedBox(
                      height: 40,
                    )
                  : ListTile(
                      leading: Text(
                        _clinicData[i - 1]['data'],
                        style: TextStyle(
                            color: pinkColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      title: Text(
                        _clinicData[i - 1]['title'],
                        style: TextStyle(
                            color: blueColorDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    );
            }),
          ),
        ),
      ],
    );
  }
}
