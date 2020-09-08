import 'package:flutter/material.dart';

class TrackerEntry extends StatelessWidget {
  final IconData icon;
  final title;
  final content;
  final Function onTap;

  const TrackerEntry({
    Key key,
    this.icon,
    this.title,
    this.content,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff372D3D),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap ?? () {},
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
      ),
    );
  }
}

class TrackerEntryTime extends StatelessWidget {
  final String start;
  final String end;
  final Function onTapStart;
  final Function onTapEnd;

  const TrackerEntryTime({
    Key key,
    this.start,
    this.end,
    this.onTapStart,
    this.onTapEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff372D3D),
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          Icons.timer,
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: onTapStart ?? () {},
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
            InkWell(
              onTap: onTapEnd ?? () {},
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
