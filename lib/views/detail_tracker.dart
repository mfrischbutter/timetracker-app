import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/models/activities.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/data.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/views/text_editor.dart';
import 'package:timetracker_app/widgets/styled_flat_button.dart';
import 'package:timetracker_app/widgets/tracker_entry.dart';

class DetailTrackerScreen extends StatelessWidget {
  final bool isEdit;
  const DetailTrackerScreen({Key key, @required this.isEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Items currentItem = Items();
    if (isEdit) {
      currentItem = Provider.of<DataProvider>(
        context,
        listen: false,
      ).selectedItem;
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

class DetailTrackerForm extends StatefulWidget {
  final Items item;
  final List<Projects> projects;
  final List<Activities> activities;
  final List<Customers> customers;
  DetailTrackerForm({
    Key key,
    this.item,
    this.projects,
    this.activities,
    this.customers,
  }) : super(key: key);

  @override
  _DetailTrackerFormState createState() => _DetailTrackerFormState();
}

class _DetailTrackerFormState extends State<DetailTrackerForm> {
  Items currentItem = Items();

  @override
  void initState() {
    super.initState();
    currentItem = widget.item;
  }

  void submit() async {
    await Provider.of<DataProvider>(
      context,
      listen: false,
    ).postItem(context, currentItem);
    Provider.of<DataProvider>(
      context,
      listen: false,
    ).getItems(false);
    Navigator.pop(context);
  }

  void _showDatePicker(context) async {
    DateTime _today = DateTime.now();
    DateTime _selectedDate = await showDatePicker(
      context: context,
      initialDate: currentItem.date,
      lastDate: _today,
      firstDate: DateTime(
        _today.year - 1,
        _today.month,
        _today.day,
      ),
    );
    if (_selectedDate != null)
      setState(() {
        currentItem.date = _selectedDate;
      });
  }

  void _showTimePicker(context, isStartTime) async {
    TimeOfDay _selectedTime = await showTimePicker(
      context: context,
      initialTime: (isStartTime) ? currentItem.start : currentItem.end,
    );
    if (_selectedTime != null)
      setState(() {
        if (isStartTime) {
          currentItem.start = _selectedTime;
        } else {
          currentItem.end = _selectedTime;
        }
      });
  }

  void _openTextEditorTicket(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: TextEditorScreen(
          inputValue: currentItem.ticket,
          placeholder: 'Ticket',
        ),
      ),
    );
    if (result != null)
      setState(() {
        currentItem.ticket = result;
      });
  }

  void _openTextEditorDescription(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: TextEditorScreen(
          inputValue: currentItem.description,
          placeholder: 'Beschreibung',
        ),
      ),
    );
    if (result != null)
      setState(() {
        currentItem.description = result;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TrackerEntry(
          icon: Icons.date_range,
          title: 'Datum',
          content: currentItem.dateString,
          onTap: () => _showDatePicker(context),
        ),
        TrackerEntryTime(
          start: currentItem.startString(context),
          end: currentItem.endString(context),
          onTapStart: () => _showTimePicker(context, true),
          onTapEnd: () => _showTimePicker(context, false),
        ),
        TrackerEntry(
          icon: Icons.label,
          title: 'Jira Ticket',
          content: widget.item.ticket,
          onTap: () => _openTextEditorTicket(context),
        ),
        TrackerEntry(
          icon: Icons.person,
          title: 'Kunde',
          content: widget.customers
              .firstWhere((element) => element.id == widget.item.customer)
              .name,
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
          content: widget.activities
              .firstWhere((element) => element.id == widget.item.activity)
              .name,
        ),
        TrackerEntry(
          icon: Icons.description,
          title: 'Beschreibung',
          content: widget.item.description,
          onTap: () => _openTextEditorDescription(context),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StyledFlatButton(
            'Speichern',
            filled: false,
            color: Colors.green,
            splashColor: Colors.green[400],
            onPressed: () {
              submit();
            },
          ),
        ),
      ],
    );
  }
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
