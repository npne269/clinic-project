import 'package:clinic_app/components/datePicker.dart';
import 'package:clinic_app/global.dart';
import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          TopArea(),
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

class TopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).padding.top,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [blueColorDark, blueColorLight],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fertility Clinic Network',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  'Book your first appointment',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.maxFinite,
                  color: backgroundColor,
                  child: Center(
                    child: Consumer<AppointmentDataProvider>(
                      builder: (context,data,child)=> DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: data.coupleTown,
                          iconSize: 40,
                          iconEnabledColor: blueColorLight,
                          style: TextStyle(
                            color: pinkColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          hint: Text(
                            'Select Town',
                            style: TextStyle(
                              color: pinkColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          items: data.dropdownItems
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (String value){
                            data.coupleTown = value;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: List.generate(5, (i) {
              return (i == 0)
                  ? SizedBox(
                      height: 40,
                    )
                  : Consumer<BasicAppDataProvider>(
                    builder: (_,data,widget)=>ListTile(
                        leading: Text(
                          data.clinicData[i - 1]['data'],
                          style: TextStyle(
                              color: pinkColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        title: Text(
                          data.clinicData[i - 1]['title'],
                          style: TextStyle(
                              color: blueColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                  );
            }),
          ),
        ),
      ],
    );
  }
}
