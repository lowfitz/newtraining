import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';
import 'package:new_bussiness_app/modules/add_ads/cubit/add_ads_cubit.dart';
import 'package:new_bussiness_app/modules/add_ads/cubit/states.dart';
import 'package:new_bussiness_app/modules/add_ads/domain/add_ad_repo.dart';
import 'package:new_bussiness_app/modules/add_ads/repo/add_ads_repo.dart';

// ignore: must_be_immutable
class AdPublishScreen extends StatefulWidget {
  AdPublishScreen(
      {super.key,
      required this.title,
      required this.describtion,
      required this.price,
      required this.phone,
      required this.whatsapp,
      required this.media,
      required this.type,
      required this.adress,
      required this.category,
      required this.sellingReason});

  String title;
  String describtion;
  String price;
  String phone;
  String whatsapp;
  File? media;
  String type;
  String adress;
  int category;
  String sellingReason;

  @override
  State<AdPublishScreen> createState() => _AdPublishScreenState();
}

class _AdPublishScreenState extends State<AdPublishScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocProvider(
      create: (context) => AddAdCubit(),
      child: BlocConsumer<AddAdCubit, AddAdStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return LoadinAndError(
            isError: state is AddAdsPageLoadingFailure,
            isLoading: state is AddAdsPageLoadingFailure,
            child: Scaffold(
              backgroundColor: const Color(0xfff4f6f8),
              body: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: ListTile(
                          title: const Text('مجانى'),
                          trailing: Checkbox(value: false, onChanged: (_) {}),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: ListTile(
                          title: const Text('ممول'),
                          trailing: Checkbox(value: false, onChanged: (_) {}),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: ListTile(
                          title: const Text('مميز'),
                          trailing: Checkbox(value: false, onChanged: (_) {}),
                        ),
                      )),
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
                              'نشر الاعلان',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await MediaRepo.postMedia(context,
                                      media: widget.media!)
                                  .then((value) async {
                                if (value != null) {
                                  await AddAdsRepo.postAd(
                                      context: context,
                                      body: {
                                        'title': widget.title,
                                        'description': widget.describtion,
                                        'address': widget.adress,
                                        'category': widget.category,
                                        'price': widget.price,
                                        'phone': "+974${widget.phone}",
                                        'whatsapp': "+974${widget.phone}",
                                        'media[]': value,
                                        'type': widget.type,
                                      });
                                } else {
                                  return;
                                }
                              });
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
        },
      ),
    );
  }

  //  Future _pickImageFromGallery() async {
  //   final XFile? galleryImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   //_selectedImage = File(galleryImage!.path);

  //   _selectedImage = File(galleryImage!.path);
  //   products.postImage = await MultipartFile.fromFile(
  //     _selectedImage!.path,
  //   );
  //   setState(() {});
  // }
}
