import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:timetracker_app/api/activity_request.dart';
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
          Material(
            color: Colors.grey[200],
            child: Container(
              width: 90.bsh(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text('ticketLabel').tr(),
                    trailing: Icon(CupertinoIcons.chevron_forward),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('customerLabel').tr(),
                    trailing: Icon(CupertinoIcons.chevron_forward),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('projectLabel').tr(),
                    trailing: Icon(CupertinoIcons.chevron_forward),
                  ),
                ],
              ),
            ),
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
}
