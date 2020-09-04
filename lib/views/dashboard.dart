import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timetracker_app/provider/items.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    Provider.of<ItemsProvider>(context, listen: false).getItems();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemsProvider>(context).items;

    return Scaffold(
        body: SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(),
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              Card(child: Center(child: Text('2'))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    ));
  }
}
