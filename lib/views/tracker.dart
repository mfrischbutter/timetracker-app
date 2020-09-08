import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/provider/projects.dart';
import 'package:timetracker_app/widgets/tracker_card.dart';
import 'package:timetracker_app/widgets/tracker_card_date.dart';

class Tracker extends StatefulWidget {
  Tracker({Key key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  DateTime currentDate;
  Duration difference;
  Widget dateCardWidget;
  String lastItemDateString;
  String itemDateString;
  List dateStringSplited;
  DateTime time = DateTime.utc(2000);
  Widget column;
  DateFormat formatter = DateFormat('dd.MM.yyyy');

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    Provider.of<ItemsProvider>(
      context,
      listen: false,
    ).getItems();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    List<Items> items = Provider.of<ItemsProvider>(
      context,
    ).items;
    List<Projects> projects = Provider.of<ProjectsProvider>(
      context,
      listen: false,
    ).projects;

    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        header: ClassicHeader(),
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child: (items.length > 0)
            ? ListView.builder(
                itemBuilder: (context, i) {
                  dateStringSplited = items[i].date.split('/');
                  currentDate = DateTime(
                    int.parse(dateStringSplited[2]),
                    int.parse(dateStringSplited[1]),
                    int.parse(dateStringSplited[0]),
                  );

                  itemDateString = formatter.format(currentDate);

                  difference = currentDate.difference(DateTime.now());
                  if (difference.inDays == 0) {
                    itemDateString = 'Heute';
                  } else if (difference.inDays == -1) {
                    itemDateString = 'Gestern';
                  }
                  if (lastItemDateString == null ||
                      lastItemDateString != itemDateString) {
                    time = items
                        .where((element) => element.date == items[i].date)
                        .fold(
                      DateTime.utc(2000, 1, 1, 0, 0),
                      (DateTime previous, element) {
                        var durations = element.duration.split(':');
                        return previous.add(
                          Duration(
                            hours: int.parse(
                              durations[0],
                            ),
                            minutes: int.parse(
                              durations[1],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  column = Column(
                    children: [
                      (lastItemDateString == null ||
                              lastItemDateString != itemDateString)
                          ? TrackerCardDate(
                              title: itemDateString,
                              time: time.hour.toString() +
                                  ':' +
                                  time.minute.toString() +
                                  'h',
                            )
                          : Container(),
                      TrackerCard(
                        id: items[i].id,
                        title: projects
                            .firstWhere(
                                (element) => element.id == items[i].project)
                            .name,
                        subtitle: items[i].start +
                            ' - ' +
                            items[i].end +
                            ' / ' +
                            items[i].duration +
                            'h',
                      ),
                    ],
                  );
                  lastItemDateString = itemDateString;
                  return column;
                },
                itemCount: items.length,
              )
            : Center(
                child: Text('you haven\'t tracked for while.'),
              ),
      ),
    );
  }
}
