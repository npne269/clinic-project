import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
    // @required Function onSubmited,
    @required String labelText,
    @required String hintText,
    @required TextEditingController controller,
    Function validator,
    this.keyBoardType = TextInputType.name,
  })  : 
  // _onSubmited = onSubmited,
        _validator = validator,
        _labelText = labelText,
        _hintText = hintText,
        _controller = controller,
        super(key: key);
  // final Function _onSubmited;
  final Function _validator;
  final String _labelText;
  final String _hintText;
  final TextInputType keyBoardType;
  final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: _controller,
        keyboardType: keyBoardType,
        // onSaved: _onSubmited,
        style: TextStyle(fontSize: 20),
        validator: _validator != null
            ? _validator
            : ( v) {
                if (v.isNotEmpty) {
                  return null;
                }
                return 'Please fill the form';
              },
        cursorColor: pinkColor,
        decoration: InputDecoration(
            labelText: _labelText,
            hintText: _hintText,
            labelStyle: TextStyle(fontSize: 17, color: blueColorLight),
            focusedBorder: focusborder,
            errorBorder: outlineborder,
            focusedErrorBorder: focusborder,
            enabledBorder: outlineborder),
      ),
    );
  }
}
