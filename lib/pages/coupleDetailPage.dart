import 'package:clinic_app/components/components.dart';
import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:clinic_app/modal/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CoupleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Couple couple = Provider.of<FormDataProvider>(context).couple;
    return Scaffold(
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
                      child: CoupleDetailTop(
                        gender: couple.couple[1].gender,
                        name: couple.couple[1].name,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: CoupleDetailTop(
                        gender: couple.couple[0].gender,
                        name: couple.couple[0].name,
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
                    child: CoupleDetailsList(
                      coupleData: couple.couple[1],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CoupleDetailsList(
                      coupleData: couple.couple[0],
                      bleedDay: couple.bleedingDate,
                      cycleDay: couple.cycleDay,
                    ),
                  ),
                ],
              ),
              Spacer(),
              BigButton(
                btnPressed: () {},
                btnLabel: 'Update',
                btnIcon: Icons.edit,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CoupleDetailsList extends StatelessWidget {
  final People _coupleData;
  final DateTime bleedDay;
  final String cycleDay;
  const CoupleDetailsList({
    Key key,
    @required People coupleData,
    this.bleedDay,
    this.cycleDay,
  })  : _coupleData = coupleData,
        super(key: key);
        

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: _coupleData.gender == 'M'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            '${_coupleData.calculateAge().toStringAsFixed(1)} yo',
            style: lightbluestyle,
          ),
          Text(
            'h ${_coupleData.height} m x ${_coupleData.weight} kg\nBMI ${_coupleData.calculateBmi()} kg/m2',
            style: lightbluestyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "ID:",
            style: lightbluestyle,
          ),
          Text(_coupleData.id),
          SizedBox(
            height: 20,
          ),
          Text(
            'phone:',
            style: lightbluestyle,
          ),
          Text(_coupleData.phoneNumber),
          SizedBox(
            height: 20,
          ),
          Text(
            'Email:',
            style: lightbluestyle,
          ),
          Text(_coupleData.email),
          _coupleData.gender == 'M'
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'First Bleeding Day:',
                      style: lightbluestyle,
                    ),
                    Text(DateFormat('M/d/y').format(bleedDay)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cycle Days:',
                      style: lightbluestyle,
                    ),
                    Text('$cycleDay days'),
                  ],
                )
        ]);
  }
}

class CoupleDetailTop extends StatelessWidget {
  const CoupleDetailTop({
    Key key,
    @required String name,
    @required String gender,
  })  : _name = name,
        _gender = gender,
        super(key: key);

  final String _name;
  final String _gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          _gender == 'M' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gender == 'M' ? blueColorLight.withAlpha(200) : pinkColor,
          ),
          child: Text(
            _gender,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            _name.replaceAllMapped(" ", (match) => '\n'),
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
