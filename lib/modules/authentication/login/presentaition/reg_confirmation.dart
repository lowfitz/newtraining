// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:new_bussiness_app/modules/authentication/login/presentaition/login.dart';
import 'package:new_bussiness_app/modules/authentication/otp/domain/otp_repo.dart';

import 'package:pinput/pinput.dart';

class RegOTPConfirmation extends StatefulWidget {
  RegOTPConfirmation(
      {super.key,
      required this.phone,
      required this.confirmPass,
      required this.name,
      required this.password});

  String phone;
  String password;
  String confirmPass;
  String name;

  @override
  State<RegOTPConfirmation> createState() => _OTPConfirmationState();
}

class _OTPConfirmationState extends State<RegOTPConfirmation> {
  final textFormKey = GlobalKey<FormState>();
  TextEditingController otpcode = TextEditingController();

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
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Pinput(
                controller: otpcode,
                length: 6,
                keyboardType: TextInputType.number,
                closeKeyboardWhenCompleted: true,
                onCompleted: (_) {}),
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
                  onPressed: () async {
                    await OTPVerifyRepo.otpverifyMethode(body: {
                      'code': otpcode.text,
                      'phone': '+974${widget.phone}',
                      'name': widget.name,
                      'password': widget.password,
                      'password_confirmation': widget.confirmPass
                    });
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LogIn(
                                    currentIndex: 0,
                                  )));
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
}
