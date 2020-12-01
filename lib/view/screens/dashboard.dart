import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:timetracker_app/view/widgets/list_of_tracked_activities.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListOfTrackedActivities(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 5.5.bsv(),
      color: AppTheme.mogicLightBlue,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 3.bsh()),
      child: Icon(
        CupertinoIcons.bars,
        color: Colors.white,
        size: 8.bsh(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
      height: 15.bsh(),
      width: 15.bsh(),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Container(
          height: 15.bsh(),
          width: 15.bsh(),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.bsh()),
              shape: BoxShape.circle,
              color: AppTheme.mogicLightBlue),
          child: Icon(Icons.add, size: 8.bsh()),
        ),
      ),
    );
  }
}
