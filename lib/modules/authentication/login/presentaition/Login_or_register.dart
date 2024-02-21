// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:new_bussiness_app/modules/login_screens/presentaition/login.dart';

class LogInOrRegister extends StatefulWidget {
  LogInOrRegister({super.key, required this.selectPage});
  int selectPage;
  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {
  var selectLogin = 0;
  @override
  void initState() {
    widget.selectPage = selectLogin;
    super.initState();
  }

// 03454563
  @override
  Widget build(BuildContext context) {
    return LogIn(
      currentIndex: selectLogin,
    );
  }
}
