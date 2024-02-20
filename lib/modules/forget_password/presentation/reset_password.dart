// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';
import 'package:new_bussiness_app/modules/login_screens/presentaition/login.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key, required this.code, required this.phone});
  String phone;
  String code;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final textFormKey = GlobalKey<FormState>();
  bool isSecure = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFormKey,
      child: Scaffold(
          body: Column(children: [
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
        const Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: Text('اعادة تعيين كلمة المرور')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "ادخل كلمة المرور ";
                }

                return null;
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isSecure,
              textAlign: TextAlign.end,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(7),
                suffixIcon: const Icon(
                  Icons.lock_outline,
                  size: 20,
                ),
                prefixIcon: obSecureToggle(),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'كلمة المرور الجديدة',
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "ادخل كلمة المرور ";
              }
              if (passwordController.text != confirmPassController.text) {
                return "كلمة المرور غير متطابقة";
              }
              return null;
            },
            controller: confirmPassController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isSecure,
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(7),
              suffixIcon: const Icon(
                Icons.lock_outline,
                size: 20,
              ),
              prefixIcon: obSecureToggle(),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: 'تأكيد كلمة المرور',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 250,
                height: 40,
                color: Colors.deepOrange[400],
                child: TextButton(
                  child: const Text(
                    'تاكيد',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onPressed: () {
                    if (textFormKey.currentState!.validate()) {
                      RemoteDataSource.postData(url: EndPoints.restPass, body: {
                        'password': passwordController.text,
                        'password_confirmation': passwordController.text,
                        'phone': '+974${widget.phone}',
                        'code': widget.code
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogIn(currentIndex: 0)));
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ])),
    );
  }

  Widget obSecureToggle() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure = !isSecure;
        });
      },
      icon: isSecure
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
