import 'package:clinic_app/modal/allAppProvider.dart';
import 'package:clinic_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppointmentDataProvider>(
          create: (_) => AppointmentDataProvider(),
        ),
        ChangeNotifierProvider<BasicAppDataProvider>(
          create: (_) => BasicAppDataProvider(),
        ),
        ChangeNotifierProvider<FormDataProvider>(
          create: (_) => FormDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Clinic App',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
