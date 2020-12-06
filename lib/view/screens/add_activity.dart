import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:timetracker_app/api/activity_request.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/projects.dart';
import 'package:timetracker_app/services.dart';
import 'package:timetracker_app/utils/helper.dart';
import 'package:timetracker_app/utils/size_config.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addActivityAppBarLabel').tr(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: 90.bsh(),
            child: AddActivityForm(),
          ),
        ),
      ),
    );
  }
}

class AddActivityForm extends StatefulWidget {
  AddActivityForm({Key key}) : super(key: key);

  @override
  _AddActivityFormState createState() => _AddActivityFormState();
}

class _AddActivityFormState extends State<AddActivityForm> {
  TimeOfDay _futureTime = TimeOfDay.fromDateTime(
    DateTime.now().add(
      Duration(minutes: 15),
    ),
  );
  ActivityRequest _data = ActivityRequest(
    date: DateTime.now(),
    start: TimeOfDay.now(),
    end: TimeOfDay.fromDateTime(
      DateTime.now().add(
        Duration(minutes: 15),
      ),
    ),
  );
  List<DropdownMenuItem<int>> _projectsDropdownList = List();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.bsv(),
          ),
          Text('dateLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          RaisedButton(
            onPressed: () async {
              final date = await _selectDate(context);
              if (date == null) {
                return;
              }
              setState(() {
                _data.date = date;
              });
            },
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.calendar_today),
                    Text(Helper().convertDateTime(_data.date)),
                  ],
                ),
                Text('changeLabel').tr(),
              ],
            ),
          ),
          SizedBox(
            height: 2.bsv(),
          ),
          Text('startTimeLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          RaisedButton(
            onPressed: () async {
              final time = await _selectTime(context);
              if (time == null) {
                return;
              }
              setState(() {
                _data.start = time;
              });
            },
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    Text(_data.start.format(context)),
                  ],
                ),
                Text('changeLabel').tr(),
              ],
            ),
          ),
          SizedBox(
            height: 2.bsv(),
          ),
          Text('endTimeLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          RaisedButton(
            onPressed: () async {
              final time = await _selectTime(context, _futureTime);
              if (time == null) {
                return;
              }
              setState(() {
                _data.end = time;
              });
            },
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    Text(_data.end.format(context)),
                  ],
                ),
                Text('changeLabel').tr(),
              ],
            ),
          ),
          SizedBox(
            height: 3.bsv(),
          ),
          Text('detailsLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          SearchableDropdown.single(
            items: services.get<CustomersProvider>().getDropdownList(),
            closeButton: 'fertig',
            value: _data.customerId ?? 0,
            hint: tr('customerLabel'),
            searchHint: tr('customerLabel'),
            searchFn: _dropdownSearchFn,
            onChanged: (value) {
              setState(() {
                _data.customerId = value;
                _projectsDropdownList = services
                    .get<ProjectsProvider>()
                    .getDropdownListByCustomer(value);
              });
            },
            isExpanded: true,
          ),
          SearchableDropdown.single(
            items: _projectsDropdownList,
            closeButton: 'fertig',
            value: _data.projectsId ?? 0,
            hint: tr('projectLabel'),
            searchHint: tr('customerLabel'),
            searchFn: _dropdownSearchFn,
            onChanged: (value) {
              setState(() {
                _data.projectsId = value;
              });
            },
            isExpanded: true,
          ),
          SizedBox(
            height: 3.bsv(),
          ),
          Text('infoLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: tr('descriptionLabel')),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          SizedBox(
            height: 3.bsv(),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.green,
            child: Center(
                child: Text(
              'saveLabel',
              style: TextStyle(
                color: Colors.white,
              ),
            ).tr()),
          ),
        ],
      ),
    );
  }

  _selectDate(context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }

  _selectTime(context, [TimeOfDay initialTime]) async {
    if (initialTime == null) {
      initialTime = TimeOfDay.now();
    }
    return await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
  }

  /// It's like the default search, except it's using the data of the text widget to compare the search value
  Function _dropdownSearchFn = (String keyword, items) {
    List<int> ret = List<int>();
    if (keyword != null && items != null && keyword.isNotEmpty) {
      keyword.split(" ").forEach((k) {
        int i = 0;
        items.forEach((item) {
          if (k.isNotEmpty &&
              (item.child.data
                  .toString()
                  .toLowerCase()
                  .contains(k.toLowerCase()))) {
            ret.add(i);
          }
          i++;
        });
      });
    }
    if (keyword.isEmpty) {
      ret = Iterable<int>.generate(items.length).toList();
    }
    return (ret);
  };
}
