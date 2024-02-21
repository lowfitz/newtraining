import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/login/cubit/login_cubit.dart';
import 'package:new_bussiness_app/modules/forget_password/presentation/forget_password.dart';
import 'package:new_bussiness_app/modules/authentication/login/domain/login_repo.dart';

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
      child: Form(
        key: loginFormKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),

            // _currentIndex == 0
            // ?
            Column(
              children: [
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
                      // prefixText: '974+',

                      //  Row(
                      //   children: [

                      //     const Padding(
                      //       padding: EdgeInsets.only(left: 5),
                      //       child: Text(
                      //         '974+',
                      //         style: TextStyle(fontSize: 10),
                      //       ),
                      //     )
                      //   ],
                      // ),
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
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              LogInRepo.logInMethode(body: {
                                'phone': "+974${_phoneController.text}",
                                'password': _passwordController.text
                              });
                            } else {
                              return;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            // // kjashdkfja
            // //sadfasdf
            // //asdfasdfasdf
            // ////sadfasdfasdf
            // //////////////////////////
            // //////////////////////////////////
            // //////////////////////////////
            // : const RegisterWidget()
          ],
        ),
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
