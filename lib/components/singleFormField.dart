import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
    @required Function onSubmited,
    @required String errorText,
    @required String labelText,
  })  : _onSubmited = onSubmited,
        _errorText = errorText,
        _labelText = labelText,
        super(key: key);
  final Function _onSubmited;
  final String _errorText;
  final String _labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        onSubmitted: _onSubmited,
        style: TextStyle(fontSize: 20),
        cursorColor: pinkColor,
        decoration: InputDecoration(
            errorText: _errorText,
            labelText: _labelText,
            labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
            focusedBorder: focusborder,
            enabledBorder: outlineborder),
      ),
    );
  }
}