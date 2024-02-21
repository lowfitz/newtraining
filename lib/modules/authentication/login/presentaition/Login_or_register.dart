import 'package:flutter/material.dart';
import 'package:new_bussiness_app/modules/authentication/login/presentaition/login.dart';
import 'package:new_bussiness_app/modules/authentication/login/presentaition/register.dart';

// ignore: must_be_immutable
class LogInOrRegister extends StatefulWidget {
  LogInOrRegister({super.key, required this.currentIndex});
  int currentIndex;
  @override
  State<LogInOrRegister> createState() => _LogInState();
}

class _LogInState extends State<LogInOrRegister> {
  final TextEditingController regnameController = TextEditingController();
  final TextEditingController regphonController = TextEditingController();
  final TextEditingController regpassword = TextEditingController();
  final TextEditingController regconfirmPassword = TextEditingController();
  final textFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    widget.currentIndex = _currentIndex;
    super.initState();
  }

  int _currentIndex = 0;
  bool isSecure = true;
  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFormKey,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Card(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Card(
                            elevation: _currentIndex == 1 ? 4 : 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: _currentIndex == 1
                                    ? bottonColor
                                    : Colors.white,
                                height: 40,
                                width: 140,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentIndex = 1;
                                    });
                                  },
                                  child: Text(
                                    'حساب جديد',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _currentIndex == 1
                                            ? textColor
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Card(
                            shadowColor: Colors.deepOrange[400],
                            elevation: _currentIndex == 0 ? 3 : 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 40,
                                width: 140,
                                child: Container(
                                  color: _currentIndex == 0
                                      ? bottonColor
                                      : Colors.white,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 0;
                                      });
                                    },
                                    child: Text(
                                      'تسجيل دخول',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: _currentIndex == 0
                                              ? textColor
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _currentIndex == 0 ? const LogIn() : const RegisterWidget()
          ],
        ),
      ),
    );
  }
}
