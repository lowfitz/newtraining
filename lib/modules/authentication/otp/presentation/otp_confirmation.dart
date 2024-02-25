// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/otp_cubit.dart';
import 'package:new_bussiness_app/modules/authentication/forget_password/presentation/reset_password.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/states.dart';

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
    return Scaffold(
      body: BlocProvider(
        create: (context) => OTPCubit(),
        child: BlocConsumer<OTPCubit, OTPStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
                BlocConsumer<OTPCubit, OTPStates>(
                  listener: (context, state) {
                    if (state is OTPVerifySuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veryfied')));
                    }

                    if (state is OTPVerifyFailure) {
                      const SnackBar(content: Text('INVALID'));
                    }
                  },
                  builder: (context, state) => Padding(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            onPressed: () async {
                              await OTPCubit.get(context).otpVerify(body: {
                                'code': otpcode.text,
                                'phone': '+974${widget.phone}'
                              });
                              if (OTPCubit.get(context).verfiycode ==
                                  otpcode.text) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ResetPassword(
                                              phone: widget.phone,
                                              code: otpcode.text,
                                            )));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Failed'),
                                        content: const Text('Invalid Code'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'))
                                        ],
                                      );
                                    });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
            );
          },
        ),
      ),
    );
  }
}
