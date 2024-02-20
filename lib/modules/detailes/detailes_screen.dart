import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/detailes/cubit/detailes_cubit.dart';
import 'package:new_bussiness_app/modules/detailes/cubit/detailes_state.dart';
import 'package:new_bussiness_app/widgets/detailes_screen_listView/detailes_listview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailesScreen extends StatefulWidget {
  const DetailesScreen({
    super.key,
  });

  @override
  State<DetailesScreen> createState() => _DetailesScreenState();
}

class _DetailesScreenState extends State<DetailesScreen> {
  int myCurrentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailesCubit()..getDetailesData(context: context),
      child: BlocConsumer<DetailesCubit, DetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = DetailesCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  // backgroundColor: ,
                  title: const Text(
                    'تفاصيل المشروع',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                body: state is DetailesPageLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(children: [
                        ListView(children: [
                          Column(children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Stack(children: [
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        myCurrentIndex = index;
                                      });
                                    },
                                    height: 200,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  carouselController: buttonCarouselController,
                                  itemCount: 1,
                                  itemBuilder: (context, index, realIndex) =>
                                      Stack(
                                    children: [
                                      Center(
                                        child: Image.network(
                                          cubit.ads[index].cover ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 180, left: 170),
                                  child: Row(
                                    children: [
                                      Center(
                                        child: AnimatedSmoothIndicator(
                                          activeIndex: myCurrentIndex,
                                          count: 2,
                                          effect: const WormEffect(
                                              dotWidth: 8, dotHeight: 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 175, left: 290),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xfff26e34),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5))),
                                    height: 25,
                                    width: 80,
                                    child: const Text(
                                      'معروض',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 290),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xfff26e34),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    height: 25,
                                    width: 80,
                                    child: Text(
                                      ' ${cubit.ads[myCurrentIndex].shortId}#',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cubit.ads[myCurrentIndex].days ??
                                                "",
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 12,
                                            child: Image.asset(
                                                'assets/images/XMLID.png'),
                                          ),
                                        ],
                                      ),

                                      //  Chip(
                                      //     side: const BorderSide(
                                      //         color: Colors.white),
                                      //     elevation: 0,
                                      //     avatar: ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cubit.ads[myCurrentIndex].views
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 12,
                                            child: Image.asset(
                                                'assets/images/visibility.png'),
                                          ),
                                        ],
                                      ),

                                      //  Chip(
                                      //     side: const BorderSide(
                                      //         color: Colors.white),
                                      //     elevation: 0,
                                      //     avatar: ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cubit.ads[myCurrentIndex]
                                                    .category ??
                                                "",
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 12,
                                            child: Image.asset(
                                                'assets/images/visibility.png'),
                                          ),
                                        ],
                                      ),

                                      //  Chip(
                                      //     side: const BorderSide(
                                      //         color: Colors.white),
                                      //     elevation: 0,
                                      //     avatar: ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15),
                              child: Center(
                                child: Card(
                                  elevation: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        cubit.ads[myCurrentIndex].address ?? "",
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        width: 140,
                                      ),
                                      // const Spacer(),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 12,
                                        child: Image.asset(
                                            'assets/images/location.png'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Card(
                                      color: const Color(0xfff26e34),
                                      child: SizedBox(
                                          height: 20,
                                          width: 70,
                                          child: Center(
                                            child: Text(
                                              '${cubit.ads[myCurrentIndex].price}  ر.ق',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          )),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    cubit.ads[myCurrentIndex].title ?? "",
                                    style: const TextStyle(
                                        color: Color(0xFF2F2F75)),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      cubit.ads[myCurrentIndex].description ??
                                          ""),
                                ),
                              ],
                            ),
                            Container(
                              color: const Color(0xFF2F2F75),
                              height: 30,
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'تفاصيل الاعلان',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            ///////////////////////
                            ///////////////////////
                            ///////////////////////
                            ///////////////////////
                          ]),
                          const DetailesListView(),
                          Container(
                            height: 40,
                            color: const Color(0xfff26e34),
                            child: const Center(
                              child: Text(
                                'سبب البيع',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 20)),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 100, right: 10),
                            child: Container(
                                width: double.infinity,
                                color: const Color(0xfff4f6f8),
                                child: const Text(
                                  'لا يوجد',
                                  textAlign: TextAlign.end,
                                )),
                          )
                        ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  color: const Color(0xFF2F2F75),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 38,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.call_rounded,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const Text(
                                                  '  اتصال',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 38,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.message_outlined,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const Text(
                                                  ' واتس اب',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 38,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const Text(
                                                  '   حفظ',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 38,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.share_outlined,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const Text(
                                                  '   مشاركة',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const Row(
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     // Padding(
                                      //     //   padding: EdgeInsets.only(left: 10, right: 10),
                                      //     //   child: Text(
                                      //     //     'اتصال',
                                      //     //     style: TextStyle(color: Colors.white),
                                      //     //   ),
                                      //     // ),
                                      //     Padding(
                                      //       padding: EdgeInsets.only(left: 10, right: 10),
                                      //       child: Text(
                                      //         'واتس أب',
                                      //         style: TextStyle(color: Colors.white),
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: EdgeInsets.only(left: 10, right: 10),
                                      //       child: Text(
                                      //         'حفظ',
                                      //         style: TextStyle(color: Colors.white),
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: EdgeInsets.only(left: 10, right: 10),
                                      //       child: Text(
                                      //         'مشاركة',
                                      //         style: TextStyle(color: Colors.white),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              )
                            ])
                      ]));
          }),
    );
  }
}
