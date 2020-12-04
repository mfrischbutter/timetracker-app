import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/models/activity.dart';
import 'package:timetracker_app/utils/helper.dart';
import 'package:timetracker_app/utils/size_config.dart';
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
          height: 1.bsv(),
        ),
        Text(
          Helper().convertDateTimeWithToday(groupedActivitiesByDay.first.date),
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 1.bsv(),
        ),
        _buildActivityList(),
        SizedBox(
          height: 2.bsv(),
        ),
      ],
    );
  }

  Widget _buildActivityList() {
    return Container(
      width: 90.bsh(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(3.bsh()),
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
                  width: 85.bsh(),
                  child: Divider(height: 0),
                );
              yield ListTile(
                onTap: () {},
                title: Text(item.ticket),
                subtitle: Text(item.description ?? tr('noDescription')),
                trailing: Chip(
                  label: Text(Helper().printDuration(item.duration)),
                  deleteIcon: Icon(
                    CupertinoIcons.clock,
                    size: 3.5.bsh(),
                  ),
                  backgroundColor: Colors.white,
                  deleteIconColor: AppTheme.mogicLightBlue,
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
