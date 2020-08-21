import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  final DateTime _date;
  final TimeOfDay _t1;
  final TimeOfDay _t2;

  const PaymentPage(
      {Key key,
      @required DateTime date,
      @required TimeOfDay time1,
      @required TimeOfDay time2})
      : _date = date,
        _t1 = time1,
        _t2 = time2,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColorDark,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEE MMM d').format(_date).toString(),
              style: TextStyle(
                  color: pinkColor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${_t1.format(context)} - ${_t2.format(context)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
            ),
            Text('£ 300',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: pinkColor),
                ),
                child: Text(
                  'Pay with credit Card'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
