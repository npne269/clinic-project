import 'package:clinic_app/components/commonappbar.dart';
import 'package:clinic_app/pages/CoupleForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../global.dart';

class CouplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        child: CommonAppBar(title: 'Couple'),
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
      ),
      body: Container(
        color: backgroundColor,
        padding: EdgeInsets.all(10),
        child: Builder(
          builder: (context) {
            return Policy(mdFileName: "Privacy_policy.md");
          },
        ),
      ),
    );
  }
}

class Policy extends StatefulWidget {
  final String mdFileName;

  Policy({Key key, @required this.mdFileName})
      : assert(
            mdFileName.contains('.md'), 'the file must be with extension .md'),
        super(key: key);

  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool swap = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: FutureBuilder(
                future:
                    Future.delayed(Duration(milliseconds: 100)).then((value) {
                  return rootBundle.loadString('assets/${widget.mdFileName}');
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Markdown(data: snapshot.data);
                  }
                  return Center(child: CircularProgressIndicator());
                })),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FlatButton(
              // minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: pinkColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CoupleForm()));
              },
              child: Text(
                'ACCEPT AND CONTINUE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
        )
      ],
    );
  }
}
