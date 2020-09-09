import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/styles/styles.dart';

class LoadingScreen extends StatelessWidget {
  initProvider(context) async {
    Provider.of<AuthProvider>(context).initAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    initProvider(context);

    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: new CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
