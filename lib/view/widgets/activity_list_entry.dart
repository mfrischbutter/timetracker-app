import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/size_config.dart';

class ActivityListEntry extends StatelessWidget {
  final String titleOfActivity;
  final Duration durationOfActivity;

  const ActivityListEntry({
    Key key,
    @required this.titleOfActivity,
    @required this.durationOfActivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.bsv()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleOfActivity),

          // using delete icon to start the timer again
          Chip(
            label: Text(
              durationOfActivity.toString().substring(0, 7),
            ),
            deleteIcon: Icon(
              CupertinoIcons.play_fill,
              size: 3.5.bsh(),
            ),
            deleteIconColor: AppTheme.mogicLightBlue,
            onDeleted: () {},
          ),
        ],
      ),
    );
  }
}
