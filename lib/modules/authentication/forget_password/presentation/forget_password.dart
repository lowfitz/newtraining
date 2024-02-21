import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/otp_cubit.dart';
import 'package:new_bussiness_app/modules/forget_password/presentation/otp_confirmation.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final textFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'استعادة كلمة المرور',
              style: TextStyle(
                  color: Colors.deepOrange[400],
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Center(
          child:
              Text('الرجاء كتابة رقم الجوال المسجل لدينا لاستعادة كلمة المرور',
                  style: TextStyle(
                    fontSize: 11,
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "ادخل رقم الهاتف";
                }
                if (!RegExp(r'^\d{8}$').hasMatch(value)) {
                  return "رقم الهاتف غير صحيح";
                }
                return null;
              },

              controller: _phoneController,
              keyboardType: TextInputType.phone,
              // validator: (value) {
              //   if (RegExp(r'^[a-z@!()$#%]').hasMatch(value!)) {
              //     return 'Please Enter Aa Valid Number';
              //   }
              //   return null;
              // },
              textAlign: TextAlign.end,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                suffixIcon: const Icon(
                  Icons.phone_in_talk_outlined,
                  size: 20,
                ),
                prefixIconConstraints: BoxConstraints.tight(const Size(72, 30)),
                prefixIcon: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/images/qatar-fl.png'),
                    ),
                    const Text('974+')
                  ],
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'رقم الجوال',
              ),
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
                    'ارسل الكود',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onPressed: () async {
                    if (textFormKey.currentState!.validate()) {
                      await OTPCubit.get(context).otpSend(
                          body: {'phone': '+974${_phoneController.text}'});
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPConfirmation(
                                      phone: _phoneController.text,
                                    )));
                      }
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
