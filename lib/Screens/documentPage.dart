import 'package:clinic_app/components/components.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
          BigButton(
            btnLabel: 'Upload Document',
            btnPressed: () => _openFileExplorer(),
            btnIcon: Icons.add_circle,
          ),
          BigButton(
            btnPressed:(){},
            btnLabel:  'Upload Monitor',
            btnIcon: Icons.add_circle,
          ),
          Expanded(
            child: FileShow(files: file),
          )
        ],
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
