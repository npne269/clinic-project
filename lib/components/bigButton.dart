import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key key,
    @required Function btnPressed,
    @required String btnLabel,
     IconData btnIcon,
  })  : _btnLabel = btnLabel,
        _btnIcon = btnIcon,
        _btnPressed = btnPressed,
        super(key: key);
  final Function _btnPressed;
  final String _btnLabel;
  final IconData _btnIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: pinkColor,
        onPressed: _btnPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _btnIcon!=null?Icon(
              _btnIcon,
              size: 30,
              color: Colors.white,
            ):Container(),
            SizedBox(
              width: _btnIcon!=null?20:0,
            ),
            Text(
              _btnLabel,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
