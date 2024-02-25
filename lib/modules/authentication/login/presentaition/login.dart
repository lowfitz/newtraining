import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/login/cubit/login_cubit.dart';
import 'package:new_bussiness_app/modules/authentication/forget_password/presentation/forget_password.dart';
import 'package:new_bussiness_app/modules/authentication/login/cubit/login_states.dart';
import 'package:new_bussiness_app/modules/home/presentaion/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({
    super.key,
  });

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  bool isSecure = true;
  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: loginFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text('رقم الجوال   ')],
                      ),
                    ),
                    PhoneTextFormField(phoneController: _phoneController),
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text('كلمة المرور   ')],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        controller: _passwordController,
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'كلمة المرور',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ForgetPassword())));
                              },
                              child: const Text('استعادة كلمة المرور',
                                  style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                      color: Colors.red))),
                        ],
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
                                'تسجيل الدخول',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              onPressed: () async {
                                if (loginFormKey.currentState!.validate()) {
                                  await LogInCubit.get(context).logInMethode(
                                      body: {
                                        'phone': "+974${_phoneController.text}",
                                        'password': _passwordController.text
                                      });
                                } else {
                                  return;
                                }

                                if (state is LogInLoadingFailure) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          child: AlertDialog(
                                            title: const Text('Login Failed'),
                                            content: const Text(
                                                'Incorect Password or Phone Number'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Close'))
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }

                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Home()));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
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

class PhoneTextFormField extends StatelessWidget {
  PhoneTextFormField({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;
  final conatinerDecoration =
      BoxDecoration(borderRadius: BorderRadius.circular(20));
  final widgetPadding = const EdgeInsets.only(left: 5, right: 5);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: conatinerDecoration,
      padding: widgetPadding,
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: 'رقم الجوال',
        ),
      ),
    );
  }
}
