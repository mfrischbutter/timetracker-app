import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/provider/projects.dart';
import 'package:timetracker_app/styles/styles.dart';

class DetailTrackerScreen extends StatelessWidget {
  const DetailTrackerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Items item = Provider.of<ItemsProvider>(
      context,
      listen: false,
    ).selectedItem;
    List<Projects> projects = Provider.of<ProjectsProvider>(
      context,
      listen: false,
    ).projects;

    return Scaffold(
        appBar: AppBar(
          title: Text('Eintrag bearbeiten'),
          backgroundColor: Styles.backgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Styles.backgroundColor,
        body: DetailTrackerForm(
          item: item,
          projects: projects,
        ));
  }
}

class DetailTrackerForm extends StatefulWidget {
  final Items item;
  final List<Projects> projects;
  DetailTrackerForm({Key key, this.item, this.projects}) : super(key: key);

  @override
  _DetailTrackerFormState createState() => _DetailTrackerFormState();
}

class _DetailTrackerFormState extends State<DetailTrackerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.date_range,
              color: Colors.white,
            ),
            title: Text(
              'Datum',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              widget.item.date.replaceAll('/', '.'),
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.timer,
              color: Colors.white,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        widget.item.start,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Ende',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      widget.item.end,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.label,
              color: Colors.white,
            ),
            title: Text(
              'Jira Ticket',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              widget.item.ticket,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Kunde',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'null',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.toys,
              color: Colors.white,
            ),
            title: Text(
              'Projekt',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              widget.projects
                  .firstWhere((element) => element.id == widget.item.project)
                  .name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.directions_run,
              color: Colors.white,
            ),
            title: Text(
              'Taetigkeit',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'null',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Colors.white,
            ),
            title: Text(
              'Beschreibung',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              widget.item.description,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
