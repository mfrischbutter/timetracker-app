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
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, i) {
            return ActivityListEntry(
              titleOfActivity: 'Test',
              durationOfActivity: Duration(minutes: 39, seconds: 12, hours: 3),
            );
          },
        ),
      ),
    );
  }
}
