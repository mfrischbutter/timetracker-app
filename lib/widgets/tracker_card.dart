import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/styles/styles.dart';

class TrackerCard extends StatelessWidget {
  final id;
  final title;
  final subtitle;
  TrackerCard({Key key, this.id, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ItemsProvider>(
          context,
          listen: false,
        ).selectItem(id);
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.lightBackgroundColor,
          border: Border.symmetric(
            vertical: BorderSide(color: Color(0xff372D3D)),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
