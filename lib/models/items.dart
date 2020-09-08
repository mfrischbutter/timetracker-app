import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Items> itemsFromResponse(List<dynamic> items) =>
    new List<Items>.from(items.map((x) => Items.fromJson(x)));

class Items {
  int id;
  DateTime date;
  TimeOfDay start;
  TimeOfDay end;
  Duration duration;
  int user;
  int itemClass;
  int customer;
  int project;
  int activity;
  String description;
  String ticket;

  Items({
    this.id,
    this.date,
    this.start,
    this.end,
    this.user,
    this.itemClass,
    this.customer,
    this.project,
    this.activity,
    this.description,
    this.ticket,
    this.duration,
  });

  get dateString => DateFormat('dd.MM.yyyy').format(date);
  get startString => (context) {
        return start.format(context);
      };
  get endString => (context) {
        return end.format(context);
      };

  get durationString => () {
        String twoDigits(int n) => n.toString().padLeft(2, "0");
        String twoDigitHours = twoDigits(duration.inHours.remainder(60));
        String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
        return "$twoDigitHours:$twoDigitMinutes";
      };

  factory Items.fromJson(Map<String, dynamic> json) {
    var dateStringSplited = json['entry']['date'].split('/');
    DateTime date = DateTime(
      int.parse(dateStringSplited[2]),
      int.parse(dateStringSplited[1]),
      int.parse(dateStringSplited[0]),
    );
    var startSplited = json['entry']['start'].split(':');
    TimeOfDay start = TimeOfDay(
      hour: int.parse(startSplited[0]),
      minute: int.parse(startSplited[1]),
    );
    var endSplited = json['entry']['end'].split(':');
    TimeOfDay end = TimeOfDay(
      hour: int.parse(endSplited[0]),
      minute: int.parse(endSplited[1]),
    );
    var durationSplited = json['entry']['duration'].split(':');
    Duration duration = Duration(
      hours: int.parse(durationSplited[0]),
      minutes: int.parse(durationSplited[1]),
    );

    return Items(
      id: int.parse(json['entry']['id']),
      date: date,
      start: start,
      end: end,
      duration: duration,
      user: json['entry']['user'],
      itemClass: json['entry']['class'],
      customer: json['entry']['customer'],
      project: json['entry']['project'],
      activity: json['entry']['activity'],
      description: json['entry']['description'],
      ticket: json['entry']['ticket'],
    );
  }
}
