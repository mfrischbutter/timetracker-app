import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/provider/activties.dart';
import 'package:timetracker_app/services.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:timetracker_app/view/widgets/activity_filter_options.dart';
import 'package:timetracker_app/view/widgets/list_of_tracked_activities.dart';
import 'package:timetracker_app/view/widgets/modal_menu.dart';
import 'package:timetracker_app/view/widgets/running_activity.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  _fetchInitialActivities() {
    if (services.get<ActivitiesProvider>().status ==
        ActivitiesStatus.Uninitialized)
      services.get<ActivitiesProvider>().fetchActivitiesForUser();
  }

  @override
  Widget build(BuildContext context) {
    _fetchInitialActivities();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                RunningActivity(),
                Consumer<ActivitiesProvider>(
                  builder: (context, activities, child) {
                    if (activities.status == ActivitiesStatus.Done) {
                      return Column(
                        children: [
                          ActivityFilterOptions(),
                          ListOfTrackedActivities(
                            activities: activities.activitiesGrouped,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20.bsv(),
                          ),
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(context) {
    return Container(
      height: 5.5.bsv(),
      color: AppTheme.mogicLightBlue,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 3.bsh()),
      child: InkWell(
        onTap: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => ModalMenu(),
          );
        },
        child: Icon(
          CupertinoIcons.bars,
          color: Colors.white,
          size: 8.bsh(),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(context) {
    return SizedBox(
      height: 15.bsh(),
      width: 15.bsh(),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, Routes.startActivity);
        },
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
