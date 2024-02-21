import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/register/presentation/reg_confirmation.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/otp_cubit.dart';
import 'package:new_bussiness_app/modules/authentication/register/cubit/register_cubit.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool isSecure = true;
  final TextEditingController regnameController = TextEditingController();
  final TextEditingController regphonController = TextEditingController();
  final TextEditingController regpassword = TextEditingController();
  final TextEditingController regconfirmPassword = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => OTPCubit(),
        )
      ],
      child: Builder(builder: (context) {
        return Form(
          key: registerFormKey,
          child: Expanded(
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              children: [
                const Padding(
                  padding: EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('اسم المستخدم   ')],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }

                      return null;
                    },
                    controller: regnameController,
                    textAlign: TextAlign.end,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(7),
                      suffixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'اسم المستخدم',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('رقم الجوال   ')],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      if (!RegExp(r'^\d{8}$').hasMatch(value)) {
                        return "رقم الهاتف غير صحيح";
                      }
                      return null;
                    },
                    controller: regphonController,
                    textAlign: TextAlign.end,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: const Icon(
                        Icons.phone_in_talk_outlined,
                        size: 20,
                      ),
                      prefixIconConstraints:
                          BoxConstraints.tight(const Size(72, 30)),
                      prefixIcon: Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/images/qatar-fl.png'),
                          ),
                          const Text('974+')
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'رقم الجوال',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('كلمة المرور   ')],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }

                      return null;
                    },
                    controller: regpassword,
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'كلمة المرور',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('تأكيد كلمة المرور   ')],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }

                      return null;
                    },
                    controller: regconfirmPassword,
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
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
                        color: Colors.deepOrange[400],
                        child: TextButton(
                          child: const Text(
                            'انشاء الحساب',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (registerFormKey.currentState!.validate()) {
                              await OTPCubit.get(context).otpSend(body: {
                                'phone': '+974${regphonController.text}'
                              });
                            } else {
                              return;
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegOTPConfirmation(
                                        phone: regphonController.text,
                                        confirmPass: regconfirmPassword.text,
                                        name: regnameController.text,
                                        password: regpassword.text)));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
