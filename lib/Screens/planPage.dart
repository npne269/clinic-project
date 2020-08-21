import 'package:clinic_app/components/commonappbar.dart';
import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CommonAppBar(title: 'Treatement plan'),
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
      ),
      body: Container(),
    );
  }
}
