import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_bussiness_app/modules/ads/add_ads/presentaion/add_publish.dart';
import 'package:new_bussiness_app/modules/home/cubit/cubit.dart';
import 'package:new_bussiness_app/modules/home/cubit/states.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';

class AddAds extends StatefulWidget {
  const AddAds({super.key});

  @override
  State<AddAds> createState() => _AdsState();
}

class _AdsState extends State<AddAds> {
  Ads ads = Ads();
  File? _selectedImage;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDetailesController =
      TextEditingController();
  final TextEditingController _projectpriceController = TextEditingController();
  final TextEditingController _projectsellingReasonController =
      TextEditingController();
  final TextEditingController _projectAdressController =
      TextEditingController();

  int _index = 0;
  Categories? _value;
  String? projectCat;
  final formKey = GlobalKey<FormState>();

  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(context: context),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: const Color(0xFF2F2F75),
                  centerTitle: true,
                  title: const Text(
                    'اضافة اعلان',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                                      elevation: _index == 1 ? 4 : 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          color: _index == 1
                                              ? bottonColor
                                              : Colors.white,
                                          height: 40,
                                          width: 140,
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _index = 1;
                                              });
                                            },
                                            child: Text(
                                              'مطلوب',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: _index == 1
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
                                      elevation: _index == 0 ? 3 : 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          height: 40,
                                          width: 140,
                                          child: Container(
                                            color: _index == 0
                                                ? bottonColor
                                                : Colors.white,
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _index = 0;
                                                });
                                              },
                                              child: Text(
                                                'معروض',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: _index == 0
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
                      const SizedBox(
                        height: 10,
                      ),
//////////////

                      /////////////

                      Expanded(
                          child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _pickImageFromGallery();
                                  },
                                  iconSize: 60,
                                  icon: Image.network(
                                    'https://th.bing.com/th/id/OIP.N6z2mM4wXM1Qsp6dCn4k1QHaHa?rs=1&pid=ImgDetMain',
                                    fit: BoxFit.cover,
                                  )),
                              _selectedImage != null
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 100,
                                      width: 100,
                                      child: Image.file(_selectedImage!))
                                  : const Center(child: Text('')),
                            ],
                          ),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: DropdownButtonFormField<Categories>(
                                    value: _value,
                                    padding: const EdgeInsets.all(0),
                                    hint: const Text(
                                      'الرجاء اختيار القسم',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    onSaved: (newValue) {
                                      setState(() {});
                                    },
                                    onChanged: (v) {
                                      _value = v;
                                    },
                                    items: cubit.categories.map((e) {
                                      return DropdownMenuItem(
                                        alignment: Alignment.centerLeft,
                                        value: e,
                                        child: Text(
                                          e.name ?? "",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      );
                                    }).toList())),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }

                                  return null;
                                },
                                controller: _projectNameController,
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }

                                  return null;
                                },
                                maxLines: 4,
                                controller: _projectDetailesController,
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }

                                  return null;
                                },
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
                              'السعر المطلوب',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }

                                  return null;
                                },
                                controller: _projectpriceController,
                                // keyboardType: TextInputType.visiblePassword,
                                // obscureText: isSecure,
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'السعر المطلوب  ',
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }

                                  return null;
                                },
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
                            padding: EdgeInsets.only(top: 10, right: 5),
                            child: Text(
                              'واتس اب',
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
                                  hintText: 'واتس اب',
                                ),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  child: Row(children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                const Text('الدفع كاش')
                              ])),
                              SizedBox(
                                  child: Row(children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                const Text('شيكات')
                              ]))
                            ],
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
                                        'الخطوة التالية',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdPublishScreen(
                                                        title:
                                                            _projectNameController
                                                                .text,
                                                        adress:
                                                            _projectAdressController
                                                                .text,
                                                        describtion:
                                                            _projectDetailesController
                                                                .text,
                                                        phone: _phoneController
                                                            .text,
                                                        price:
                                                            _projectpriceController
                                                                .text,
                                                        sellingReason:
                                                            _projectsellingReasonController
                                                                .text,
                                                        type: _index == 0
                                                            ? 'required'
                                                            : 'provided',
                                                        category:
                                                            _value?.id ?? 0,
                                                        media: _selectedImage!,
                                                        whatsapp:
                                                            _phoneController
                                                                .text,
                                                      )));
                                        }
                                      }),
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
    final XFile? galleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    //_selectedImage = File(galleryImage!.path);

    _selectedImage = File(galleryImage!.path);
    // ads.media = await MultipartFile.fromFile(
    //   _selectedImage!.path,

    setState(() {});
  }
}
