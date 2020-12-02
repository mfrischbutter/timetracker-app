import 'package:flutter/material.dart';
import 'package:timetracker_app/utils/helper.dart';

class Activity {
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

  Activity({
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

  factory Activity.fromJson(Map<String, dynamic> json) {
    DateTime date = Helper().convertApiDate(json['entry']['date']);
    TimeOfDay start = Helper().convertApiTime(json['entry']['start']);
    TimeOfDay end = Helper().convertApiTime(json['entry']['end']);
    Duration duration = Helper().convertApiDuration(json['entry']['duration']);

    return Activity(
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
