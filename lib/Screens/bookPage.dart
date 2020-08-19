import 'package:clinic_app/components/datePicker.dart';
import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [blueColorDark, blueColorLight],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: List.generate(5, (i) {
                    return (i==0)?SizedBox(
                      height: 40,
                    ):ListTile(
                      leading: Text(
                        _clinicData[i-1]['data'],
                        style: TextStyle(
                            color: pinkColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      title: Text(
                        _clinicData[i-1]['title'],
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
          ),
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
