import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/modules/account/presentation/profile.dart';
import 'package:new_bussiness_app/modules/authentication/user/cubit/user_cubit.dart';
import 'package:new_bussiness_app/modules/authentication/login/presentaition/Login_or_register.dart';
import 'package:new_bussiness_app/modules/authentication/user/cubit/user_states.dart';

class LoggedInAccountScreen extends StatefulWidget {
  const LoggedInAccountScreen({super.key});

  @override
  State<LoggedInAccountScreen> createState() => _LoggedInAccountScreenState();
}

class _LoggedInAccountScreenState extends State<LoggedInAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getaccountDetiles(context),
      child: BlocConsumer<UserCubit, UserStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = UserCubit.get(context);
            return LoadinAndError(
              isError: state is UserLoadingFailure,
              isLoading: state is UserLoading,
              child: Scaffold(
                backgroundColor: const Color(0xfff4f6f8),
                body: ListView(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: Image.network(
                                    cubit.user?.data?.avatar ?? "")),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                cubit.user?.data?.name ?? "",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LogInOrRegister(
                                              currentIndex: 0,
                                            )));
                                Utils.removeToken();
                              },
                              child: const Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProfileScreen())),
                              child: const Text(
                                'ملف شخصى',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'ملف شخصى',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ملف شخصى',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_outline_outlined,
                              color: Colors.black45,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
