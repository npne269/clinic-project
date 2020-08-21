import 'package:clinic_app/components/commonappbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:io';

import '../global.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  var file;
  void _openFileExplorer() async {
    List<File> _file;
    _file = await FilePicker.getMultiFile();
    setState(() {
      file = _file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CommonAppBar(title: 'Upload docs'),
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
      ),
      body: Column(
        children: [
          UploadButton(
            btnLabel: 'Upload Document',
            btnPressed: () => _openFileExplorer(),
          ),
          UploadButton(
            btnPressed:(){},
            btnLabel:  'Upload Monitor',
          ),
          Expanded(
            child: FileShow(files: file),
          )
        ],
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key key,
    @required Function btnPressed,
    @required String btnLabel,
  })  : _btnLabel = btnLabel,
        _btnPressed = btnPressed,
        super(key: key);
  final Function _btnPressed;
  final String _btnLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: pinkColor,
          onPressed: _btnPressed,
          child: ListTile(
              leading: Icon(
                Icons.add_circle,
                size: 30,
                color: Colors.white,
              ),
              title: Text(
                _btnLabel,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}

class FileShow extends StatelessWidget {
  const FileShow({
    Key key,
    @required List<File> files,
  })  : _files = files,
        super(key: key);
  final List<File> _files;
  @override
  Widget build(BuildContext context) {
    return _files != null
        ? ListView.builder(
            itemCount: _files.length,
            itemBuilder: (_, i) => ListTile(
              onTap: () => _files[i].open(),
              title: Text(
                '${_files[i].uri}',
              ),
              subtitle: Text(
                '${_files[i].path}',
              ),
            ),
          )
        : Center(
          child: Text('File is not picked'),
        );
  }
}
