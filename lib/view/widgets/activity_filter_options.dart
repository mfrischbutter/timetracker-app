import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class ActivityFilterOptions extends StatefulWidget {
  ActivityFilterOptions({Key key}) : super(key: key);

  @override
  _ActivityFilterOptionsState createState() => _ActivityFilterOptionsState();
}

class _ActivityFilterOptionsState extends State<ActivityFilterOptions> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.bsh(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          3,
          (int index) {
            return ChoiceChip(
              label: Text('dayOption$index').tr(),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = index;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
