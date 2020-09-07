import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/styles/styles.dart';

class LoadingScreen extends StatelessWidget {
  initAuthProvider(context) async {
    Provider.of<AuthProvider>(context).initAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    initAuthProvider(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Timetracker App'),
        backgroundColor: Styles.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
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
