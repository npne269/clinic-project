import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatelessWidget {
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
            Consumer<AppointmentDataProvider>(
              builder: (_, data, widget) => Text(
                DateFormat('EEE MMM d').format(data.appointmentDate).toString(),
                style: TextStyle(
                    color: pinkColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<AppointmentDataProvider>(
              builder: (_, data, widget) => Text(
                data.appointmentTimeFrom != null &&
                        data.appointmentTimeTo != null
                    ? '${data.appointmentTimeFrom.format(context)} - ${data.appointmentTimeTo.format(context)}'
                    : '',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              '£ 300',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
