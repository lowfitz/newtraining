import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/account/cubit/cubit.dart';
import 'package:new_bussiness_app/modules/authentication/login/cubit/login_states.dart';
import 'package:new_bussiness_app/modules/authentication/user/cubit/user_cubit.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var textFormKey = GlobalKey<FormState>();
  TextEditingController editPhoneController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserCubit()..getaccountDetiles(context),
        child: BlocConsumer<UserCubit, UserStates>(
          listener: (context, state) {
            if (state is UserLoadingSuccess) {
              final cubit = UserCubit.get(context);
              editNameController.text = cubit.user?.data?.name ?? "";
              editPhoneController.text = cubit.user?.data?.phone ?? "";
            }
          },
          builder: (context, state) {
            final cubit = UserCubit.get(context);
            return LoadinAndError(
                isError: state is UserLoadingFailure,
                isLoading: state is UserLoading,
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: const Color(0xFF2F2F75),
                      title: const Text('بياناتى'),
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
                        height: 30,
                      ),
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
                          controller: editNameController,
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: TextFormField(
                          controller: editPhoneController,
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'رقم الجوال',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /////////
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
                                  'حفظ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                onPressed: () async {
                                  await UpdateUserCubit.get(context)
                                      .updateUserMethode(body: {
                                    'phone': '+974${editPhoneController.text}',
                                    'name': editNameController.text
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])));
          },
        ));
  }
}
