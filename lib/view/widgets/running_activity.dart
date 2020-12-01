import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class RunningActivity extends StatelessWidget {
  const RunningActivity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.bsv(),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.bsv(), horizontal: 4.bsh()),
          width: 90.bsh(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(3.bsh()),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppTheme.mogicDarkBlue, AppTheme.mogicLightBlue],
            ),
          ),
          child: _buildBoxContent(),
        ),
        SizedBox(
          height: 1.bsv(),
        ),
      ],
    );
  }

  _buildBoxContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Meeting',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '00:03:23',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 2.bsv(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Text(
              'stopLabel',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
          ],
        ),
      ],
    );
  }
}
