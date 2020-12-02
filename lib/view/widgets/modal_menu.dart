import 'package:flutter/material.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class ModalMenu extends StatelessWidget {
  const ModalMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.bsh(), vertical: 3.bsh()),
      height: 20.bsv(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/mogic-logo.png'),
                height: 4.bsv(),
              ),
              SizedBox(
                width: 5.bsh(),
              ),
              Text(
                'mogicLabel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
            ],
          ),
          Divider(
            height: 2.bsv(),
          ),
          Text('timelineLabel').tr(),
          Divider(
            height: 2.bsv(),
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
