import 'package:clinic_app/components/commonappbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
//   String _fileName;
//   String _path;
//   Map<String, String> _paths;
//   String _extension;
//   bool _loadingPath = false;
//   bool _multiPick = false;
//   bool _hasValidMime = false;
//   FileType _pickingType;
//   TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() => _extension = _controller.text);
//   }

//   void _openFileExplorer() async {
//     if (_pickingType != FileType.custom || _hasValidMime) {
//       try {
//         _path = await FilePicker.getFilePath(
//             type: _pickingType, allowedExtensions: [_extension]);
//       } on PlatformException catch (e) {
//         print("Unsupported operation" + e.toString());
//       }

//       if (!mounted) return;

//       setState(() {
//         _fileName = _path != null ? _path.split('/').last : '...';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           child: CommonAppBar(title: 'Upload docs'),
//           preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
//         ),
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   color: pinkColor,
//                   onPressed: () => _openFileExplorer(),
//                   child: ListTile(
//                       leading: Icon(
//                         Icons.add_circle,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Upload document',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   color: pinkColor,
//                   onPressed: () {},
//                   child: ListTile(
//                       leading: Icon(
//                         Icons.add_circle,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         'Upload monitor',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )),
//                 ),
//               ),
//             ),
//             FileShow(
//                 loadingPath: _loadingPath,
//                 path: _path,
//                 paths: _paths,
//                 fileName: _fileName)
//           ],
//         ));
//   }
// }

// class FileShow extends StatelessWidget {
//   const FileShow({
//     Key key,
//     @required bool loadingPath,
//     @required String path,
//     @required Map<String, String> paths,
//     @required String fileName,
//   })  : _loadingPath = loadingPath,
//         _path = path,
//         _paths = paths,
//         _fileName = fileName,
//         super(key: key);

//   final bool _loadingPath;
//   final String _path;
//   final Map<String, String> _paths;
//   final String _fileName;

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (BuildContext context) => _loadingPath
//           ? Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: const CircularProgressIndicator())
//           : _path != null || _paths != null
//               ? Container(
//                   padding: const EdgeInsets.only(bottom: 30.0),
//                   height: MediaQuery.of(context).size.height * 0.50,
//                   child: Scrollbar(
//                       child: ListView.separated(
//                     itemCount:
//                         _paths != null && _paths.isNotEmpty ? _paths.length : 1,
//                     itemBuilder: (BuildContext context, int index) {
//                       final bool isMultiPath =
//                           _paths != null && _paths.isNotEmpty;
//                       final String name = 'File $index: ' +
//                           (isMultiPath
//                               ? _paths.keys.toList()[index]
//                               : _fileName ?? '...');
//                       final path = isMultiPath
//                           ? _paths.values.toList()[index].toString()
//                           : _path;

//                       return ListTile(
//                         title: Text(
//                           name,
//                         ),
//                         subtitle: Text(path),
//                       );
//                     },
//                     separatorBuilder: (BuildContext context, int index) =>
//                         Divider(),
//                   )),
//                 )
//               : Container(),
//     );
//   }
// }

  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FilePickerApp"),
        ),
        body: Container(
          child: Center(
              child: Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: new RaisedButton(
                  onPressed: () => _openFileExplorer(),
                  child: new Text("Open file picker"),
                ),
              ),
              new Builder(
                builder: (BuildContext context) => _loadingPath
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const CircularProgressIndicator())
                    : _path != null || _paths != null
                        ? new Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: new Scrollbar(
                                child: new ListView.separated(
                              itemCount: _paths != null && _paths.isNotEmpty
                                  ? _paths.length
                                  : 1,
                              itemBuilder: (BuildContext context, int index) {
                                final bool isMultiPath =
                                    _paths != null && _paths.isNotEmpty;
                                final String name = 'File $index: ' +
                                    (isMultiPath
                                        ? _paths.keys.toList()[index]
                                        : _fileName ?? '...');
                                final path = isMultiPath
                                    ? _paths.values.toList()[index].toString()
                                    : _path;

                                return new ListTile(
                                  title: new Text(
                                    name,
                                  ),
                                  subtitle: new Text(path),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      new Divider(),
                            )),
                          )
                        : new Container(),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
