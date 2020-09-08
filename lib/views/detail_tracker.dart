import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/data.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/widgets/styled_flat_button.dart';
import 'package:timetracker_app/widgets/tracker_entry.dart';

class DetailTrackerScreen extends StatelessWidget {
  const DetailTrackerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Items item = Provider.of<DataProvider>(
      context,
      listen: false,
    ).selectedItem;
    List<Projects> projects = Provider.of<DataProvider>(
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
  void submit() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TrackerEntry(
          icon: Icons.date_range,
          title: 'Datum',
          content: widget.item.date.replaceAll('/', '.'),
        ),
        TrackerEntryTime(
          start: widget.item.start,
          end: widget.item.end,
        ),
        TrackerEntry(
          icon: Icons.label,
          title: 'Jira Ticket',
          content: widget.item.ticket,
        ),
        TrackerEntry(
          icon: Icons.person,
          title: 'Kunde',
          content: 'null',
        ),
        TrackerEntry(
          icon: Icons.toys,
          title: 'Projekt',
          content: widget.projects
              .firstWhere((element) => element.id == widget.item.project)
              .name,
        ),
        TrackerEntry(
          icon: Icons.directions_run,
          title: 'Tätigkeit',
          content: 'null',
        ),
        TrackerEntry(
          icon: Icons.description,
          title: 'Beschreibung',
          content: widget.item.description,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StyledFlatButton(
            'Löschen',
            filled: false,
            color: Colors.red,
            splashColor: Colors.red[400],
            onPressed: () {
              print('delete');
            },
          ),
        ),
      ],
    );
  }
}
