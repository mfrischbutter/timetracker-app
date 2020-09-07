import 'package:flutter/material.dart';
import 'package:timetracker_app/styles/styles.dart';

class TrackerCardDate extends StatelessWidget {
  final title;
  final time;
  TrackerCardDate({Key key, @required this.title, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.backgroundColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          time ?? '',
          style: TextStyle(
            color: Styles.contrastColor,
          ),
        ),
      ),
    );
  }
}
