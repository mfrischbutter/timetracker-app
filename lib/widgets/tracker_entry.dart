import 'package:flutter/material.dart';

class TrackerEntry extends StatelessWidget {
  final IconData icon;
  final title;
  final content;
  const TrackerEntry({
    Key key,
    this.icon,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class TrackerEntryTime extends StatelessWidget {
  final String start;
  final String end;
  const TrackerEntryTime({Key key, this.start, this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.timer,
        color: Colors.white,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  start,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Ende',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                end,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
