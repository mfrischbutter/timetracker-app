import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
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
            onPressed: () {},
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.calendar_today),
                    Text(' 31.12.2020'),
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
            onPressed: () {},
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    Text(' 12:23'),
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
            onPressed: () {},
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    Text(' 15:50'),
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
}
