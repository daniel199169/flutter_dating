import 'package:flutter/material.dart';
import 'package:nubae/firebase_services/authentication.dart';
import 'package:nubae/screens/view/cloud_message.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/screens/view/login.dart';
import 'package:nubae/screens/view/search.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class LoginCheck extends StatefulWidget {
  LoginCheck({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    // SessionManager.handleClearAllSettging();
    Auth().getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
    // print("--------- login status ---------");
    // print(authStatus);
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  AuthStatus CheckAuthState() {
    String userId = SessionManager.getUserId();
    if (userId == null || userId.length == 0) return AuthStatus.NOT_LOGGED_IN;
    return AuthStatus.LOGGED_IN;
  }

  @override
  Widget build(BuildContext context) {
    authStatus = CheckAuthState();
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new CloudMessage();
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          print("------ already logined -------");
          return new SearchPage();
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}
