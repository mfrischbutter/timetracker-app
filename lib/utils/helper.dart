import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Helper {
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

  String convertDateTime(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  String convertDateTimeWithToday(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date == today) {
      return tr('todayLabel');
    } else if (date == yesterday) {
      return tr('yesterdayLabel');
    }
    return DateFormat('dd.MM.yyy').format(date);
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }
}
