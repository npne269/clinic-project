import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  const DatePicker({
    Key key,
    @required this.initialDate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 400,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) {
        DateTime date = initialDate.add(Duration(days: i));
        return InkWell(
          onTap: () {
            print('lol $date');
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: pinkColor,
            child: Container(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat.MMMM().format(date),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
