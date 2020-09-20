import 'package:flutter/material.dart';

import 'package:timetracker_app/styles/styles.dart';

class ListSelectorScreen extends StatefulWidget {
  final String inputValue;
  final List<dynamic> items;
  ListSelectorScreen({
    Key key,
    this.inputValue,
    this.items,
  }) : super(key: key);

  @override
  _ListSelectorScreenState createState() => _ListSelectorScreenState();
}

class _ListSelectorScreenState extends State<ListSelectorScreen> {
  TextEditingController _controller;
  String inputValue;
  List<dynamic> newDataList;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    newDataList = List.from(widget.items);
    inputValue = widget.inputValue;
  }

  _onItemChanged(String value) {
    setState(() {
      newDataList = widget.items
          .where(
            (string) => string.name.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
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
            onChanged: _onItemChanged,
            autofocus: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Suche',
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
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  newDataList[i].name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                color: Color(0xff372D3D),
              ),
            ],
          );
        },
        itemCount: newDataList.length,
      ),
    );
  }
}
