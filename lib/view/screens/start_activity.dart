import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class StartActivityScreen extends StatelessWidget {
  const StartActivityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('startActivityAppBarLabel').tr(),
      ),
      body: Container(
        child: Text('Start Activity'),
      ),
    );
  }
}
