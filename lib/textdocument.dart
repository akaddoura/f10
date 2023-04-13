import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Editor extends StatefulWidget {
  const Editor({Key? key}) : super(key: key);

  // @override
  // _EditorState createState() = _EditorState();

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late String _text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call me Ishmael."),
      ),
      body: Container(),
    );
  }
}
