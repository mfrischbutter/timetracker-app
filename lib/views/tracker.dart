import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/widgets/tracker_card.dart';

class Tracker extends StatefulWidget {
  Tracker({Key key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    Provider.of<ItemsProvider>(context, listen: false).getItems();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ItemsProvider>(context).items;

    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        header: ClassicHeader(),
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child:
          (items.length == 0) ?
            ListView.builder(
              itemBuilder: (context, i) => TrackerCard(title: items[i].ticket, subtitle: items[i].date),
              itemExtent: 100.0,
              itemCount: items.length,
            )
          : Text('you haven\'t tracked for while.'),
      ),
    );
  }
}
