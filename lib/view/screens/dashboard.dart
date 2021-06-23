import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/provider/activties.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/project_activities.dart';
import 'package:timetracker_app/provider/projects.dart';
import 'package:timetracker_app/provider/settings.dart';
import 'package:timetracker_app/services.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetracker_app/view/widgets/activity_filter_options.dart';
import 'package:timetracker_app/view/widgets/list_of_tracked_activities.dart';
import 'package:timetracker_app/view/widgets/modal_menu.dart';
import 'package:timetracker_app/view/widgets/running_activity.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key key}) : super(key: key);
  int _daysToFilterActivities;

  _fetchInitialActivities() {
    if (services.get<ActivitiesProvider>().status ==
        ActivitiesStatus.Uninitialized) {
      services.get<ActivitiesProvider>().fetchActivitiesForUser();
      services.get<ProjectActivitiesProvider>().fetchProjectActivities();
      services.get<ProjectsProvider>().fetchProjects();
      services.get<CustomersProvider>().fetchCustomers();
    }
    services.get<SettingsProvider>().daysToFilterActivities.listen((val) {
      if (_daysToFilterActivities == null) {
        return _daysToFilterActivities = val;
      }
      services.get<ActivitiesProvider>().fetchActivitiesForUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchInitialActivities();
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
                Consumer4<ActivitiesProvider, ProjectActivitiesProvider,
                    ProjectsProvider, CustomersProvider>(
                  builder: (context, activities, projectActivties, projects,
                      customers, child) {
                    if (activities.status == ActivitiesStatus.Done &&
                        projectActivties.status ==
                            ProjectActivitiesStatus.Done &&
                        projects.status == ProjectsStatus.Done &&
                        customers.status == CustomersStatus.Done) {
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
                            height: 20.h,
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
      height: 5.5.h,
      color: AppTheme.mogicLightBlue,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 3.w),
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
          size: 8.w,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(context) {
    return SizedBox(
      height: 15.w,
      width: 15.w,
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, Routes.startActivity);
        },
        child: Container(
          height: 15.w,
          width: 15.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.w),
              shape: BoxShape.circle,
              color: AppTheme.mogicLightBlue),
          child: Icon(Icons.add, size: 8.w),
        ),
      ),
    );
  }
}
