import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: 80.bsh(),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/mogic-logo.png'),
                    height: 25.bsv(),
                  ),
                  SizedBox(
                    height: 7.bsv(),
                  ),
                  _buildForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool biometricAuth = false;

  Widget _buildForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(labelText: tr('usernameLabel')),
          ),
          SizedBox(
            height: 2.bsv(),
          ),
          TextFormField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(labelText: tr('passwordLabel')),
          ),
          SizedBox(
            height: 1.bsv(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('activateBiometricAuth').tr(),
              Switch(
                activeColor: AppTheme.mogicLightBlue,
                value: biometricAuth,
                onChanged: (val) {
                  setState(() {
                    biometricAuth = val;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 1.bsv(),
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.dashboard);
              },
              child: Text(
                tr('loginBtn'),
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}