// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';
import 'package:new_bussiness_app/modules/forget_password/presentation/reset_password.dart';

import 'package:pinput/pinput.dart';

class OTPConfirmation extends StatefulWidget {
  OTPConfirmation({super.key, required this.phone});

  String phone;

  @override
  State<OTPConfirmation> createState() => _OTPConfirmationState();
}

class _OTPConfirmationState extends State<OTPConfirmation> {
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
                  onPressed: () {
                    RemoteDataSource.postData(url: EndPoints.vertfyOtp, body: {
                      'code': otpcode.text,
                      'phone': '+974${widget.phone}'
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ResetPassword(
                                  phone: widget.phone,
                                  code: otpcode.text,
                                )));
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
