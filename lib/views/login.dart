import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/utils/validator.dart';
import 'package:timetracker_app/widgets/notification_text.dart';
import 'package:timetracker_app/widgets/styled_flat_button.dart';


class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        leading: Container(),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: LogInForm(),
          ),
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username;
  String password;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      await Provider.of<AuthProvider>(context, listen: false).login(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Timetracker LDAP Login',
            textAlign: TextAlign.center,
            style: Styles.h1,
          ),
          SizedBox(height: 10.0),
          Consumer<AuthProvider>(
            builder: (context, provider, child) => provider.notification ?? NotificationText(''),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            decoration: Styles.input.copyWith(
              hintText: 'Nutzername',
            ),
            validator: (value) {
              username = value.trim();
              return Validate.requiredField(value, 'Nutername ist erforderlich.');
            }
          ),
          SizedBox(height: 15.0),
          TextFormField(
            obscureText: true,
            decoration: Styles.input.copyWith(
              hintText: 'Passwort',
            ),
            validator: (value) {
              password = value.trim();
              return Validate.requiredField(value, 'Passwort ist erforderlich.');
            }
          ),
          SizedBox(height: 15.0),
          StyledFlatButton(
            'Anmelden',
            onPressed: submit,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
