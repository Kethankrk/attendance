import 'package:attendance_app/widgets/login.dart';
import 'package:attendance_app/widgets/register.dart';
import 'package:flutter/widgets.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _Authentication();
}

class _Authentication extends State<Authentication> {
  String _currentPage = "login";

  void goToRegister() {
    setState(() {
      _currentPage = "register";
    });
  }

  void goToLogin() {
    setState(() {
      _currentPage = "login";
    });
  }

  @override
  Widget build(context) {
    return _currentPage == "login"
        ? LoginPage(
            goToRegister: goToRegister,
          )
        : RegisterPage(
            goToLogin: goToLogin,
          );
  }
}
