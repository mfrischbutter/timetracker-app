import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/models/activities.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/data.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/widgets/detail_form.dart';

class DetailTrackerScreen extends StatelessWidget {
  final bool isEdit;
  final int id;
  const DetailTrackerScreen({
    Key key,
    @required this.isEdit,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Items currentItem = Items();
    if (isEdit) {
      currentItem = Provider.of<DataProvider>(
        context,
        listen: false,
      ).getCustomer(id);
    }
    List<Projects> projects = Provider.of<DataProvider>(
      context,
      listen: false,
    ).projects;
    List<Activities> activities = Provider.of<DataProvider>(
      context,
      listen: false,
    ).activities;
    List<Customers> customers = Provider.of<DataProvider>(
      context,
      listen: false,
    ).customers;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.backgroundColor,
          elevation: 10,
          centerTitle: true,
        ),
        backgroundColor: Styles.backgroundColor,
        body: DetailTrackerForm(
          item: currentItem,
          projects: projects,
          activities: activities,
          customers: customers,
        ));
  }
}
