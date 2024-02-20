import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/detailes/detailes_screen.dart';
import 'package:new_bussiness_app/modules/home/cubit/cubit.dart';
import 'package:new_bussiness_app/modules/home/cubit/states.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => HomeCubit()..getHomeData(context: context),
            child: BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = HomeCubit.get(context);

                  return LoadinAndError(
                    isError: state is HomePageLoadingFailure,
                    isLoading: state is HomePageLoading,
                    child: ListView(
                      children: [
                        Column(children: [
                          CarouselSlider.builder(
                            itemCount: cubit.slides.length,
                            itemBuilder: (context, index, realIndex) =>
                                Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  cubit.slides[index].image ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20)),
                            //   padding: const EdgeInsets.all(10),
                            //   width: double.infinity,
                            //   height: 150,
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(20),
                            //     child: Image.asset(
                            //       'assets/images/Slide.png',
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),

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
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              // onPageChanged: (){},
                              scrollDirection: Axis.horizontal,
                            ),
                            carouselController: buttonCarouselController,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: AnimatedSmoothIndicator(
                              activeIndex: myCurrentIndex,
                              count: 2,
                              effect:
                                  const WormEffect(dotWidth: 8, dotHeight: 8),
                            ),
                          ),
                        ]),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 1 / 1),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                            elevation: 10,
                            child: Container(
                              height: 150,
                              width: 150,
                              color: Colors.white30,
                              child: GridTile(
                                footer: Center(
                                    child: Text(
                                        cubit.categories[index].name ?? "")),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Image.network(
                                      cubit.categories[index].iconUrl ?? "",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'أحدث الاعلانات',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'تصفح احدث المشاريع فى محطة الاعمال',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.ads.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 2),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GridTile(
                            footer: Padding(
                              padding: const EdgeInsets.only(left: 9, right: 9),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                child: SizedBox(
                                  height: 40,
                                  child: GridTileBar(
                                    backgroundColor: const Color(0xFF2F2F75),
                                    title: InkWell(
                                      child: const Center(
                                          child: Text('عرض تفاصيل المشروع')),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailesScreen()));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                color: Colors.white,
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                width: 150,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xfff26e34),
                                                            child: IconButton(
                                                              icon: const Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 5),
                                                            child: Card(
                                                              color: const Color(
                                                                  0xfff26e34),
                                                              child: SizedBox(
                                                                width: 60,
                                                                child: Text(
                                                                  '${cubit.ads[index].price} ر.ق',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(children: [
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 5.0),
                                                        child: Text(
                                                          cubit.ads[index]
                                                                  .title ??
                                                              "",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          textAlign:
                                                              TextAlign.end,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                      ),
                                                    ]),
                                                    const Divider(),
                                                    SizedBox(
                                                      height: 30,
                                                      width: 250,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 90,
                                                            height: 30,
                                                            child: Card(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    cubit.ads[index]
                                                                            .address ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    radius: 12,
                                                                    child: Image
                                                                        .asset(
                                                                            'assets/images/cat-4.png'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 90,
                                                            height: 30,
                                                            child: Card(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    cubit.ads[index]
                                                                            .category ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Image.asset(
                                                                      'assets/images/location.png'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width: 250,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 90,
                                                            height: 30,
                                                            child: Card(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    cubit.ads[index]
                                                                            .category ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    radius: 12,
                                                                    child: Image
                                                                        .asset(
                                                                            'assets/images/location.png'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 90,
                                                            height: 30,
                                                            child: Card(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  const Text(
                                                                    'معدات',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Image.asset(
                                                                      'assets/images/cat-4.png'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 0,
                                              child: SizedBox(
                                                height: 120,
                                                width: 150,
                                                child: Image.network(
                                                  cubit.ads[index].cover ?? "",
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            // Expanded(child: child)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })));
  }
}
