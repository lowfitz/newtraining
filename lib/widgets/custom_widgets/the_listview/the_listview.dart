import 'package:flutter/material.dart';
import 'package:new_bussiness_app/modules/detailes/detailes_screen.dart';

class NewListView extends StatefulWidget {
  const NewListView({super.key});

  @override
  State<NewListView> createState() => _NewListViewState();
}

class _NewListViewState extends State<NewListView> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          childAspectRatio: 2),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GridTile(
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
                    child: const Center(child: Text('عرض تفاصيل المشروع')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailesScreen()));
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                              const Color(0xfff26e34),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Card(
                                            color: Color(0xfff26e34),
                                            child: SizedBox(
                                              width: 60,
                                              child: Text(
                                                '1000\$',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Row(children: [
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                      child: Text(
                                        'معدات كافيه للبيع',
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ]),
                                  const Divider(),
                                  SizedBox(
                                    height: 30,
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          height: 30,
                                          child: Card(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'الدوحة',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
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
                                        SizedBox(
                                          width: 90,
                                          height: 30,
                                          child: Card(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'معدات',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                                  SizedBox(
                                    height: 30,
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          height: 30,
                                          child: Card(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'الدوحة',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
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
                                        SizedBox(
                                          width: 90,
                                          height: 30,
                                          child: Card(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'معدات',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                              child: Image.asset(
                                'assets/images/ads-home.png',
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
      ],
    );

    // SizedBox(
    //   height: 600,
    //   child: ListView(
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: [
    //       Container(
    //         padding: const EdgeInsets.all(15),
    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    //         height: 200,
    //         width: double.infinity,
    //         child: const Row(
    //           children: [
    //             Card(
    //               elevation: 5,
    //               child: SizedBox(
    //                 height: 20,
    //                 child: Row(
    //                   children: [
    //                     Expanded(child: Icon(Icons.favorite_border)),
    //                     Chip(label: Text('1000\$'))
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Row()
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
