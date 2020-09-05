import 'package:flutter/material.dart';
import 'package:timetracker_app/styles/styles.dart';

class TrackerCard extends StatelessWidget {
  final title;
  final subtitle;
  TrackerCard({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Border.all(),
      margin: new EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
      child: Container(
        decoration:
            BoxDecoration(color: Styles.backgroundColor.withOpacity(0.8)),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }
}
