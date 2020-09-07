import 'package:flutter/material.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/styles/styles.dart';

class DetailTrackerScreen extends StatefulWidget {
  final Items item;
  DetailTrackerScreen({Key key, this.item}) : super(key: key);

  @override
  _DetailTrackerScreenState createState() => _DetailTrackerScreenState();
}

class _DetailTrackerScreenState extends State<DetailTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eintrag bearbeiten'),
        backgroundColor: Styles.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Styles.backgroundColor,
      body: Text('Detail Page'),
    );
  }
}
