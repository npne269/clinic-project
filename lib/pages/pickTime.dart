import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:clinic_app/pages/paymentPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PickedTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColorDark,
        title: Text(
          'Appointment Time',
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
            Text(
              'Tap time:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text('From:'),
            TimeFieldContainer(
              isFromTime: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text('To:'),
            TimeFieldContainer(
              isFromTime: false,
            ),
          ],
        ),
      ),
    );
  }
}

class TimeFieldContainer extends StatelessWidget {
  final bool _isFromTime;

  const TimeFieldContainer({Key key, @required bool isFromTime})
      : _isFromTime = isFromTime,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    void _pickTime() async {
      TimeOfDay locTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (_isFromTime) {
        Provider.of<AppointmentDataProvider>(context,listen: false).appointmentTimeFrom =
            locTime;
      } else {
        Provider.of<AppointmentDataProvider>(context,listen: false).appointmentTimeTo =
            locTime;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentPage(),
          ),
        );
      }
    }

    return InkWell(
      onTap: _pickTime,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: pinkColor),
        ),
        child: Consumer<AppointmentDataProvider>(
          builder: (_, data, widget) => Text(
            _isFromTime
                ?data.appointmentTimeFrom !=null? data.appointmentTimeFrom.format(context):'Select Time ☺'
                : data.appointmentTimeTo !=null? data.appointmentTimeTo.format(context):'Select Time ☺',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
