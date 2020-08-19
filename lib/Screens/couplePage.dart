import 'package:flutter/material.dart';
import 'package:clinic_app/global.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../global.dart';

class CouplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
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
                'couple',
                style: TextStyle(
                    color: headingcolor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [blueColorDark, blueColorLight]),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
      ),
      body: Container(
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

class Policy extends StatelessWidget {
  final String mdFileName;

  Policy({Key key, @required this.mdFileName})
      : assert(
            mdFileName.contains('.md'), 'the file must be with extension .md'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: FutureBuilder(
                future:
                    Future.delayed(Duration(milliseconds: 100)).then((value) {
                  return rootBundle.loadString('assets/$mdFileName');
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Markdown(data: snapshot.data);
                  }
                  return Center(child: CircularProgressIndicator());
                })),
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          child: FlatButton(
              // minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: pinkColor,
              onPressed: () {},
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
