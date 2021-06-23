import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:timetracker_app/provider/settings.dart';
import 'package:timetracker_app/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ActivityFilterOptions extends StatefulWidget {
  ActivityFilterOptions({Key key}) : super(key: key);

  @override
  _ActivityFilterOptionsState createState() => _ActivityFilterOptionsState();
}

class _ActivityFilterOptionsState extends State<ActivityFilterOptions> {
  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<int>(
      preference: services.get<SettingsProvider>().daysToFilterActivities,
      builder: (context, days) {
        return _buildBody(days);
      },
    );
  }

  _buildBody(daysIndex) {
    return Container(
      width: 90.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          3,
          (int index) {
            return ChoiceChip(
              label: Text('dayOption$index').tr(),
              selected: daysIndex == index,
              onSelected: (bool selected) {
                services.get<SettingsProvider>().daysToFilterActivities = index;
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
