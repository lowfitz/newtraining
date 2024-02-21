import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/otp_cubit.dart';
import 'package:new_bussiness_app/modules/forget_password/presentation/forget_password.dart';
import 'package:new_bussiness_app/modules/authentication/login/domain/login_repo.dart';
import 'package:new_bussiness_app/modules/authentication/login/presentaition/reg_confirmation.dart';

// ignore: must_be_immutable
class LogIn extends StatefulWidget {
  LogIn({super.key, required this.currentIndex});
  int currentIndex;
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            _currentIndex == 0
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text('رقم الجوال   ')],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                                  child:
                                      Image.asset('assets/images/qatar-fl.png'),
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
                            hoverColor: bottonColor,
                            fillColor: bottonColor,
                            focusColor: bottonColor,
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
                                onPressed: () {
                                  if (textFormKey.currentState!.validate()) {
                                    LogInRepo.logInMethode(body: {
                                      'phone': "+974${_phoneController.text}",
                                      'password': _passwordController.text
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                // kjashdkfja
                //sadfasdf
                //asdfasdfasdf
                ////sadfasdfasdf
                //////////////////////////
                //////////////////////////////////
                //////////////////////////////
                : Expanded(
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
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
                              hoverColor: bottonColor,
                              fillColor: bottonColor,
                              focusColor: bottonColor,
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
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
                                    child: Image.asset(
                                        'assets/images/qatar-fl.png'),
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
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
                              hoverColor: bottonColor,
                              fillColor: bottonColor,
                              focusColor: bottonColor,
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
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
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20)),
                        //   padding: const EdgeInsets.only(left: 5, right: 5),
                        //   child: TextFormField(
                        //     obscureText: isSecure,
                        //     textAlign: TextAlign.end,
                        //     textAlignVertical: TextAlignVertical.center,
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.zero,
                        //       suffixIcon: const Icon(Icons.lock_outline),
                        //       prefix: IconButton(
                        //         icon: obSecureToggle(),
                        //         onPressed: () {},
                        //       ),
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(15)),
                        //       hintText: 'كلمة المرور',
                        //     ),
                        //   ),
                        // ),
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
                                    await OTPCubit.get(context).otpSend(body: {
                                      'phone': '+974${regphonController.text}'
                                    });
                                    // RemoteDataSource.postData(
                                    //     url: EndPoints.sendOTP,
                                    //     body: {
                                    //       'phone':
                                    //           '+974${regphonController.text}'
                                    //     });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => RegOTPConfirmation(
                                                phone: regphonController.text,
                                                confirmPass:
                                                    regconfirmPassword.text,
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
