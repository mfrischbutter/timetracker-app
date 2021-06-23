import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/models/activity.dart';
import 'package:timetracker_app/utils/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class DayListCollection extends StatelessWidget {
  final List groupedActivitiesByDay;
  const DayListCollection({
    Key key,
    @required this.groupedActivitiesByDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Text(
          Helper().convertDateTimeWithToday(groupedActivitiesByDay.first.date),
          style: Theme.of(context).textTheme.headline2.copyWith(
                color: Color(0xff7d7c7c),
              ),
        ),
        SizedBox(
          height: 1.h,
        ),
        _buildActivityList(context),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  Widget _buildActivityList(BuildContext context) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(3.w),
        ),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.unmodifiable(
          () sync* {
            int i = 0;
            for (Activity item in groupedActivitiesByDay) {
              if (i > 0)
                yield Container(
                  width: 85.w,
                  child: Divider(height: 0),
                );
              yield ListTile(
                onTap: () {},
                title: Text(
                  item.ticket,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(
                  item.description ?? tr('noDescription'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                trailing: Chip(
                  label: Text(
                    Helper().printDuration(item.duration),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.black),
                  ),
                  deleteIcon: Icon(
                    CupertinoIcons.clock,
                    size: 3.5.w,
                  ),
                  backgroundColor: Colors.white,
                  deleteIconColor: Theme.of(context).primaryColor,
                  onDeleted: () {},
                ),
              );
              i++;
            }
          }(),
        ),
      ),
    );
  }
}
