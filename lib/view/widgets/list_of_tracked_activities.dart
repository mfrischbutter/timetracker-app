import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:timetracker_app/view/widgets/day_list_collection.dart';

class ListOfTrackedActivities extends StatelessWidget {
  final Map activities;
  const ListOfTrackedActivities({
    Key key,
    @required this.activities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.bsh(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.unmodifiable(
          () sync* {
            for (final activityGroup in activities.values) {
              yield DayListCollection(
                groupedActivitiesByDay: activityGroup,
              );
            }
          }(),
        ),
      ),
    );
  }
}
