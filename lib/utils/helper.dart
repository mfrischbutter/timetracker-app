import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Helper {
  final intl = Intl.defaultLocale = 'de_DE';

  DateTime convertApiDate(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  TimeOfDay convertApiTime(String time) {
    var timeSplited = time.split(':');
    return TimeOfDay(
      hour: int.parse(timeSplited[0]),
      minute: int.parse(timeSplited[1]),
    );
  }

  Duration convertApiDuration(String duration) {
    var durationSplited = duration.split(':');
    return Duration(
      hours: int.parse(durationSplited[0]),
      minutes: int.parse(durationSplited[1]),
    );
  }
}
