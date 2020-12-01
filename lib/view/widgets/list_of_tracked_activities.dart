import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:timetracker_app/view/widgets/activity_list_entry.dart';
import 'package:timetracker_app/view/widgets/activity_list_title.dart';

class ListOfTrackedActivities extends StatelessWidget {
  const ListOfTrackedActivities({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.bsh(),
        child: Column(
          children: List.unmodifiable(
            () sync* {
              for (int i = 0; i < 10; i++) {
                if (i != 0) {
                  yield Divider(
                    height: 0,
                  );
                }
                yield ActivityListTitle(
                  dayOfActivity: DateTime.now(),
                );
                yield Divider(
                  height: 0,
                );
                yield ActivityListEntry(
                  titleOfActivity: 'Test',
                  durationOfActivity:
                      Duration(minutes: 39, seconds: 12, hours: 3),
                );
              }
            }(),
          ),
        ),
      ),
    );
  }
}
