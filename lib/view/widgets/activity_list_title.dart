import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/size_config.dart';

class ActivityListTitle extends StatelessWidget {
  final DateTime dayOfActivity;

  const ActivityListTitle({Key key, this.dayOfActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.bsv()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(dayOfActivity.toIso8601String()),
        ],
      ),
    );
  }
}
