import 'package:flutter/material.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ModalMenu extends StatelessWidget {
  const ModalMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
      height: 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/mogic-logo.png'),
                height: 4.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'mogicLabel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
            ],
          ),
          Divider(
            height: 2.h,
          ),
          Text('timelineLabel').tr(),
          Divider(
            height: 2.h,
          ),
          Text('settingsLabel').tr(),
          TextButton(
            onPressed: () {
              services.get<AuthProvider>().logOut();
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            child: Text('logout (debug)'),
          ),
        ],
      ),
    );
  }
}
