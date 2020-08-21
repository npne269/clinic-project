import 'package:clinic_app/global.dart';
import 'package:clinic_app/pages/paymentPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickedTimePage extends StatefulWidget {
  final DateTime date;
  const PickedTimePage({Key key, @required this.date}) : super(key: key);
  @override
  _PickedTimePageState createState() => _PickedTimePageState();
}

class _PickedTimePageState extends State<PickedTimePage> {
  TimeOfDay _pickedTimeFrom = TimeOfDay.now();
  TimeOfDay _pickedTimeTo = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _pickTime(int x) async {
      TimeOfDay locTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      setState(() {
        if (x == 1) {
          _pickedTimeFrom = locTime;
        } else if (x == 2) {
          _pickedTimeTo = locTime;
          Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentPage(
            date: widget.date,
            time1: _pickedTimeFrom,
            time2: _pickedTimeTo,
          ),),);
        } else {
          _pickedTimeFrom = TimeOfDay.now();
          _pickedTimeTo = TimeOfDay.now();
        }
      });
    }

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
            Text(
              DateFormat('EEE MMM d').format(widget.date).toString(),
              style: TextStyle(
                  color: pinkColor, fontSize: 24, fontWeight: FontWeight.bold),
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
              pickedTimeFrom: _pickedTimeFrom,
              onTap: () => _pickTime(1),
            ),
            SizedBox(
              height: 20,
            ),
            Text('To:'),
            TimeFieldContainer(
              pickedTimeFrom: _pickedTimeTo,
              onTap: () => _pickTime(2),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeFieldContainer extends StatelessWidget {
  const TimeFieldContainer({
    Key key,
    @required TimeOfDay pickedTimeFrom,
    @required Function onTap,
  })  : _pickedTimeFrom = pickedTimeFrom,
        _onTap = onTap,
        super(key: key);

  final TimeOfDay _pickedTimeFrom;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: pinkColor),
        ),
        child: Text(
          _pickedTimeFrom.format(context),
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
