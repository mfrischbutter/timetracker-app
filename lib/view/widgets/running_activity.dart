import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class RunningActivity extends StatelessWidget {
  const RunningActivity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding:
              EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w, bottom: 1.h),
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(3.w),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
          child: _buildBoxContent(context),
        ),
        SizedBox(
          height: 1.h,
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
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
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
                  Radius.circular(20.w),
                ),
                child: Container(
                  padding: EdgeInsets.all(2.w),
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
