import 'package:flutter/material.dart';

class ActivityRequest {
  DateTime date;
  TimeOfDay start;
  TimeOfDay end;
  int customerId;
  int projectsId;

  ActivityRequest({
    this.date,
    this.start,
    this.end,
    this.customerId,
    this.projectsId,
  });

  Map<String, dynamic> toMap() => {
        "date": date,
        "start": start,
        "end": end,
      };
}
