import 'package:flutter/material.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/views/tracker.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static List<Widget> _navBarWidgets = <Widget>[
    Tracker(),
    Center(child: Text('coming soon!')),
    Center(child: Text('coming soon too!'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Tracker'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.multiline_chart),
              title: Text('Summary'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Styles.primaryColor,
          unselectedItemColor: Styles.contrastColor,
          backgroundColor: Styles.backgroundColor,
          onTap: _onItemTapped,
        ),
        body: _navBarWidgets.elementAt(_currentIndex));
  }
}
