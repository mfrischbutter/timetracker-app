import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/widgets/styled_flat_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void logout() async {
      await Provider.of<AuthProvider>(context, listen: false).logOut();
    }

    return Center(
      child: StyledFlatButton(
        'Logout',
        onPressed: () async {
          logout();
        },
      ),
    );
  }
}
