import 'package:flutter/material.dart';
import '/widgets/auth_form.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  void _submitAuthForm(
      String email, String password, String username, bool isLogin) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}
