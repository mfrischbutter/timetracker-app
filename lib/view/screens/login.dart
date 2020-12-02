import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/api/login_request.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'package:timetracker_app/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:timetracker_app/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginRequest _data = LoginRequest();
  bool _loading = false;
  String _error;

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
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(labelText: tr('usernameLabel')),
            onSaved: (value) => _data.username = value,
            validator: (value) {
              return Validator.requiredField(value, tr('usernameRequired')) ??
                  _error ??
                  null;
            },
          ),
          SizedBox(
            height: 2.bsv(),
          ),
          TextFormField(
            style: TextStyle(fontSize: 20),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(labelText: tr('passwordLabel')),
            onSaved: (value) => _data.password = value,
            validator: (value) {
              return Validator.requiredField(value, tr('passwordRequired')) ??
                  _error ??
                  null;
            },
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
              onPressed: _submit,
              child: _loading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text(
                      tr('loginBtn'),
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          )
        ],
      ),
    );
  }

  _submit() async {
    if (_loading) {
      return;
    }

    final _form = _formKey.currentState;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    setState(() {
      _loading = true;
      _error = null;
    });

    if (_form.validate()) {
      _form.save();

      final bool login = await authProvider.login(_data);

      if (login) {
        return Navigator.pushReplacementNamed(context, Routes.dashboard);
      }
      setState(() {
        _error = tr('loginFailed');
      });
      _form.validate();
    }

    setState(() {
      _loading = false;
    });
  }
}
