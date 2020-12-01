import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:timetracker_app/view/widgets/day_list_collection.dart';

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
              for (int i = 0; i < 5; i++) {
                yield DayListCollection();
              }
            }(),
          ),
        ),
      ),
    );
  }
}
