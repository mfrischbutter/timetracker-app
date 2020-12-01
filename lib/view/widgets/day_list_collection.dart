import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/size_config.dart';

class DayListCollection extends StatelessWidget {
  const DayListCollection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Today',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 1.bsv(),
        ),
        _buildActivityList(),
        SizedBox(
          height: 4.bsv(),
        ),
      ],
    );
  }

  Widget _buildActivityList() {
    return Container(
      width: 90.bsh(),
      padding: EdgeInsets.all(2.bsh()),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(3.bsh()),
        ),
        color: Colors.grey[100],
      ),
      child: Column(
        children: List.unmodifiable(
          () sync* {
            for (int i = 0; i < 5; i++) {
              if (i != 0) {
                yield Divider();
              }
              yield Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '23.02.2019',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Meeting'),
                    ],
                  ),

                  // using delete icon to start the timer again
                  Chip(
                    label: Text('00:23:15'),
                    deleteIcon: Icon(
                      CupertinoIcons.play_fill,
                      size: 3.5.bsh(),
                    ),
                    backgroundColor: Colors.white,
                    deleteIconColor: AppTheme.mogicLightBlue,
                    onDeleted: () {},
                  ),
                ],
              );
            }
          }(),
        ),
      ),
    );
  }
}
