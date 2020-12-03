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
          padding: EdgeInsets.only(
              top: 2.bsv(), left: 4.bsh(), right: 4.bsh(), bottom: 1.bsv()),
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
          child: _buildBoxContent(context),
        ),
        SizedBox(
          height: 1.bsv(),
        ),
      ],
    );
  }

  _buildBoxContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Meeting',
              style: Theme.of(context).textTheme.headline1,
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
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.all(
                  Radius.circular(20.bsh()),
                ),
                child: Container(
                  padding: EdgeInsets.all(2.bsh()),
                  child: Text(
                    'stopLabel',
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
