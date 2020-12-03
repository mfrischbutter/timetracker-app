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
          Text('timeLabel').tr(),
          SizedBox(
            height: 1.bsv(),
          ),
          Text('TimeSelector'),
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
                    title: Text('Ticket'),
                    trailing: Icon(CupertinoIcons.chevron_forward),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Kunde'),
                    trailing: Icon(CupertinoIcons.chevron_forward),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Projekt'),
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
          ),
        ],
      ),
    );
  }
}
