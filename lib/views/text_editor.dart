import 'package:flutter/material.dart';

import 'package:timetracker_app/styles/styles.dart';

class TextEditorScreen extends StatefulWidget {
  final String inputValue;
  final String placeholder;
  TextEditorScreen({
    Key key,
    this.inputValue,
    this.placeholder,
  }) : super(key: key);

  @override
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  TextEditingController _controller;
  String inputValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.inputValue,
    );
    inputValue = widget.inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          alignment: Alignment.centerLeft,
          color: Styles.backgroundColor,
          child: TextField(
            controller: _controller,
            autofocus: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeholder ?? '',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        backgroundColor: Styles.backgroundColor,
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                inputValue = _controller.text;
              });
              Navigator.pop(context, inputValue);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Fertig',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Styles.backgroundColor,
      body: null,
    );
  }
}
