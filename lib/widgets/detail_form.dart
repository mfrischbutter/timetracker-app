import 'package:provider/provider.dart';
import 'package:timetracker_app/models/activities.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/provider/data.dart';
import 'package:timetracker_app/views/list_selector.dart';
import 'package:timetracker_app/views/text_editor.dart';
import 'package:timetracker_app/widgets/slide_up_route.dart';
import 'package:timetracker_app/widgets/styled_flat_button.dart';
import 'package:timetracker_app/widgets/tracker_entry.dart';
import 'package:timetracker_app/widgets/upper_case_formatter.dart';

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
  void submit() async {
    await Provider.of<DataProvider>(
      context,
      listen: false,
    ).postItem(context, widget.item);
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
      initialDate: widget.item.date,
      lastDate: _today,
      firstDate: DateTime(
        _today.year - 1,
        _today.month,
        _today.day,
      ),
    );
    if (_selectedDate != null)
      setState(() {
        widget.item.date = _selectedDate;
      });
  }

  void _showTimePicker(context, isStartTime) async {
    TimeOfDay _selectedTime = await showTimePicker(
      context: context,
      initialTime: (isStartTime) ? widget.item.start : widget.item.end,
    );
    if (_selectedTime != null)
      setState(() {
        if (isStartTime) {
          widget.item.start = _selectedTime;
        } else {
          widget.item.end = _selectedTime;
        }
      });
  }

  void _openTextEditorTicket(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: TextEditorScreen(
          inputValue: widget.item.ticket,
          inputFormatter: [UpperCaseTextFormatter()],
          placeholder: 'Ticket',
        ),
      ),
    );
    if (result != null)
      setState(() {
        widget.item.ticket = result;
      });
  }

  void _openListSelectorProject(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: ListSelectorScreen(
          items: widget.projects,
        ),
      ),
    );
    if (result != null)
      setState(() {
        widget.item.project = result;
      });
  }

  void _openListSelectorCustomer(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: ListSelectorScreen(
          items: widget.customers,
        ),
      ),
    );
    if (result != null)
      setState(() {
        widget.item.customer = result;
      });
  }

  void _openListSelectorActivity(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: ListSelectorScreen(
          items: widget.activities,
        ),
      ),
    );
    if (result != null)
      setState(() {
        widget.item.activity = result;
      });
  }

  void _openTextEditorDescription(context) async {
    final result = await Navigator.push(
      context,
      SlideUpRoute(
        page: TextEditorScreen(
          inputValue: widget.item.description,
          placeholder: 'Beschreibung',
        ),
      ),
    );
    if (result != null)
      setState(() {
        widget.item.description = result;
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
          content: widget.item.dateString,
          onTap: () => _showDatePicker(context),
        ),
        TrackerEntryTime(
          start: widget.item.startString(context),
          end: widget.item.endString(context),
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
          onTap: () => _openListSelectorCustomer(context),
        ),
        TrackerEntry(
          icon: Icons.toys,
          title: 'Projekt',
          content: widget.projects
              .firstWhere((element) => element.id == widget.item.project)
              .name,
          onTap: () => _openListSelectorProject(context),
        ),
        TrackerEntry(
          icon: Icons.directions_run,
          title: 'Tätigkeit',
          content: widget.activities
              .firstWhere((element) => element.id == widget.item.activity)
              .name,
          onTap: () => _openListSelectorActivity(context),
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
