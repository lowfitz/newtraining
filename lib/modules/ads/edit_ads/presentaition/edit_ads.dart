// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_bussiness_app/modules/ads/ads_cubit/ads_cubit.dart';

import 'package:new_bussiness_app/modules/edit_ads/cubit/show_states.dart';
import 'package:new_bussiness_app/modules/edit_ads/domain/edit_repo.dart';

import 'package:new_bussiness_app/modules/home/domain/home_model.dart';
import 'package:new_bussiness_app/modules/home/domain/home_repo.dart';

class EditAdsScreen extends StatefulWidget {
  EditAdsScreen({super.key, required this.adId});
  String? adId;
  @override
  State<EditAdsScreen> createState() => _EditAdsState();
}

class _EditAdsState extends State<EditAdsScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDetailesController =
      TextEditingController();
  final TextEditingController _projectsellingReasonController =
      TextEditingController();
  final TextEditingController _projectAdressController =
      TextEditingController();

  int index = 0;
  Categories? _value;
  String? projectCat;
  final formKey = GlobalKey<FormState>();

  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShowItemCubit()..showAdsData(context: context, id: widget.adId ?? ""),
      child: BlocConsumer<ShowItemCubit, ShowItemStates>(
          listener: (context, state) {
        if (state is ShowItemPageLoadingSuccess) {
          final cubit = ShowItemCubit.get(context);
          _phoneController.text = cubit.adItem?.phone ?? "";
          _projectAdressController.text = cubit.adItem?.address ?? "";
          _projectDetailesController.text = cubit.adItem?.description ?? "";
          _projectNameController.text = cubit.adItem?.title ?? "";
          _projectsellingReasonController.text = cubit.adItem?.details ?? "";
          _value = cubit.adItem?.category;
        }
      }, builder: (context, state) {
        final cubit = ShowItemCubit.get(context);
        // setState(() {
        //   _phoneController.text = cubit.adItem?.phone ?? "";
        //   _projectAdressController.text = cubit.adItem?.address ?? "";
        //   _projectDetailesController.text = cubit.adItem?.description ?? "";
        //   _projectNameController.text = cubit.adItem?.title ?? "";
        //   _projectsellingReasonController.text =
        //       cubit.adItem?.details ?? "";
        // });

        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF2F2F75),
              centerTitle: true,
              title: const Text(
                'تعديل اعلان',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              _pickImageFromGallery();
                            },
                            child: const Text('pickImage')),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 100,
                          child: Image.network(
                              cubit.adItem?.images?[index].url ?? "")),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'القسم',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: AppDropDown<Categories>(
                              itemAsString: (s) {
                                return s.name ?? "";
                              },
                              onChange: (v) {
                                if (kDebugMode) {
                                  print(v.id);
                                }
                              },
                              value: _value,
                              items: () => HomeRepo.getCateogry(),
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'اسم المشروع',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            controller: _projectNameController,
                            // keyboardType: TextInputType.visiblePassword,
                            // obscureText: isSecure,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'اسم المشروع  ',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'الوصف',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            maxLines: 8,
                            controller: _projectDetailesController,
                            // keyboardType: TextInputType.visiblePassword,
                            // obscureText: isSecure,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'الوصف  ',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'الموقع',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            controller: _projectAdressController,
                            // keyboardType: TextInputType.visiblePassword,
                            // obscureText: isSecure,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'الموقع  ',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'سبب البيع',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            controller: _projectsellingReasonController,
                            // keyboardType: TextInputType.visiblePassword,
                            // obscureText: isSecure,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'سبب البيع  ',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'واتس اب',
                          textAlign: TextAlign.end,
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

                            hintText: 'واتس اب',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          'رقم الاتصال',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
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
                                    child: Image.asset(
                                        'assets/images/qatar-fl.png'),
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
                                  'حفظ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  await EditAdsRepo.editAdsData(
                                      id: widget.adId ?? "",
                                      body: {
                                        'category': _value?.id,
                                        'title': _projectNameController.text,
                                        'description':
                                            _projectDetailesController.text,
                                        'address':
                                            _projectAdressController.text,
                                        'phone': '+974${_phoneController.text}',
                                        'whatsapp':
                                            '+974${_phoneController.text}',
                                        'type': 'required',
                                      });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      ///////////
                      /////////////
                      ///////////
                      /////////
                      )
                  // Expanded(
                  //   child: _index == 0
                  //       ? ListView.builder(
                  //           itemCount: 3,
                  //           itemBuilder: (_, index) {
                  //             return const SizedBox(
                  //                 height: 200, child: ReusableGridView());
                  //           })
                  //       : ListView.builder(
                  //           itemCount: 1,
                  //           itemBuilder: (_, index) {
                  //             return const SizedBox(
                  //                 height: 200, child: ReusableGridView());
                  //           }),
                  // )
                  //     ? SizedBox(/*height: 200, child: ReusableGridView()*/)
                  //     : const SizedBox(height: 200, child: ReusableGridView()),
                  // const SizedBox(height: 200, child: ReusableGridView()),
                  // const SizedBox(height: 200, child: ReusableGridView()),
                ],
              ),
            ));
      }),
    );
  }

  Future _pickImageFromGallery() async {
    //_selectedImage = File(galleryImage!.path);

    // ads.media = await MultipartFile.fromFile(
    //   _selectedImage!.path,

    setState(() {});
  }
}

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    this.value,
    required this.items,
    required this.itemAsString,
    required this.onChange,
  });
  final T? value;
  final Future<List<T>> Function() items;
  final String Function(T) itemAsString;
  final Function(T) onChange;
  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  T? value;
  late Future<List<T>> future;
  @override
  void initState() {
    log("message");
    log(widget.value.toString());
    value = widget.value;
    future = widget.items.call();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppDropDown<T> oldWidget) {
    if (widget.value != oldWidget.value) {
      value = widget.value;
      // setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
        future: (future),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (data.data == null || data.hasError) {
            return const Text("error");
          }
          return DropdownButtonFormField<T>(
            value: value,
            items: data.data
                    ?.map((e) => DropdownMenuItem<T>(
                        value: e, child: Text(widget.itemAsString(e))))
                    .toList() ??
                [],
            padding: const EdgeInsets.all(0),
            hint: const Text(
              'الرجاء اختيار القسم',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 12),
            ),
            onSaved: (newValue) {},
            onChanged: (v) {
              if (v == null) return;
              value = v;
              setState(() {});
              widget.onChange(v);
            },
          );
        });
  }
}
