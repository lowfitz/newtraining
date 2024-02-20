import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/modules/account/presentation/profile_edit.dart';
import 'package:new_bussiness_app/modules/forget_password/presentation/reset_password.dart';
import 'package:new_bussiness_app/modules/login_screens/cubit/states.dart';
import 'package:new_bussiness_app/modules/login_screens/cubit/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    appBar: AppBar(
                      backgroundColor: const Color(0xFF2F2F75),
                      title: const Text('ملفي الشخصي'),
                      centerTitle: true,
                    ),
                    backgroundColor: const Color(0xfff4f6f8),
                    body: ListView(children: [
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const EditProfile()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'بياناتى',
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ResetPassword(
                                              code: Utils.token,
                                              phone: cubit.user?.data?.phone ??
                                                  "")));
                                },
                                child: const Text(
                                  'تغيير كلمة السر',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black45),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.lock,
                                color: Colors.black45,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ])));
          },
        ));
  }
}
