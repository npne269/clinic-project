import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class CoupleDetail extends StatefulWidget {
  @override
  _CoupleDetailState createState() => _CoupleDetailState();
}

class _CoupleDetailState extends State<CoupleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [blueColorDark, blueColorLight])),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blueColorLight.withAlpha(200)),
                            child: Text('M',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Bradley \n Cooper',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: pinkColor),
                            child: Text('F',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Scarlet \nJhonsson',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '40 yo',
                            style: lightbluestyle,
                          ),
                          Text(
                            'h 1.75 cm x 66 kg\nBMI 29.4 kg/m2',
                            style: lightbluestyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "ID:",
                            style: lightbluestyle,
                          ),
                          Text('fjkdf123hjdf'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'phone:',
                            style: lightbluestyle,
                          ),
                          Text('+1234567890'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email:',
                            style: lightbluestyle,
                          ),
                          Text('asdfgh@asd.com')
                        ]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '40 yo',
                            style: lightbluestyle,
                          ),
                          Text(
                            'h 1.75 cm x 66 kg\nBMI 29.4 kg/m2',
                            style: lightbluestyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "ID:",
                            style: lightbluestyle,
                          ),
                          Text('fjkdf123hjdf'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'phone:',
                            style: lightbluestyle,
                          ),
                          Text('+1234567890'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email:',
                            style: lightbluestyle,
                          ),
                          Text('asdfgh@asd.com'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'First Bleeding Day:',
                            style: lightbluestyle,
                          ),
                          Text('8/20/2020'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Cycle Days:',
                            style: lightbluestyle,
                          ),
                          Text('28 days'),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    padding: EdgeInsets.only(left: 90),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: pinkColor,
                    onPressed: () {},
                    child: ListTile(
                        leading: Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
