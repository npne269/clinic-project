import 'package:flutter/material.dart';

import '../global.dart';

class CommonAppBar extends StatelessWidget {
  final String title;

  CommonAppBar({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: MediaQuery.of(context).padding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fertility Clinic Network',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: headingcolor, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [blueColorDark, blueColorLight]),
      ),
    );
  }
}
