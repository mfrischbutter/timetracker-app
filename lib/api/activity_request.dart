import 'package:flutter/material.dart';

class ActivityRequest {
  DateTime date;
  TimeOfDay start;
  TimeOfDay end;

  ActivityRequest({
    this.date,
    this.start,
    this.end,
  });

  Map<String, dynamic> toMap() => {
        "date": date,
      };
}
