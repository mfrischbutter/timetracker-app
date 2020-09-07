import 'package:timetracker_app/models/customers.dart';

List<Items> itemsFromResponse(List<dynamic> items) =>
    new List<Items>.from(items.map((x) => Items.fromJson(x)));

class Items {
  String id;
  String date;
  String start;
  String end;
  int user;
  int customer;
  int activity;
  String description;
  String ticket;
  String duration;

  Items(
      {this.id,
      this.date,
      this.start,
      this.end,
      this.user,
      this.customer,
      this.activity,
      this.description,
      this.ticket,
      this.duration});

  factory Items.fromJson(Map<String, dynamic> json) => new Items(
      id: json['entry']['id'],
      date: json['entry']['date'],
      start: json['entry']['start'],
      end: json['entry']['end'],
      user: json['entry']['user'],
      customer: json['entry']['customer'],
      activity: json['entry']['activity'],
      description: json['entry']['description'],
      ticket: json['entry']['ticket'],
      duration: json['entry']['duration']);
}
