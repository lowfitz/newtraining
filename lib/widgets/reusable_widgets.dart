import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:new_bussiness_app/General/loading_and_error.dart';
import 'package:new_bussiness_app/modules/ads/ads_index/ads_cubit/ads_cubit.dart';
import 'package:new_bussiness_app/modules/ads/ads_index/ads_cubit/ads_states.dart';
import 'package:new_bussiness_app/modules/ads/ads_index/domain/ads_repo.dart';
import 'package:new_bussiness_app/modules/ads/delete_ads/cubit/cubit.dart';
import 'package:new_bussiness_app/modules/ads/edit_ads/presentaition/edit_ads.dart';

class AdsGridView extends StatefulWidget {
  const AdsGridView({
    super.key,
    required this.selectedIndez,
  });

  final int? selectedIndez;
  @override
  State<AdsGridView> createState() => _AdsGridViewState();
}

class _AdsGridViewState extends State<AdsGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdsCubit()
        ..getAdsData(context: context, query: {
          'status': widget.selectedIndez == 0 ? 'pending' : 'accepted'
        }),
      child: BlocConsumer<AdsCubit, AdsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AdsCubit.get(context);

          return LoadinAndError(
            isError: state is AdsPageLoadingFailure,
            isLoading: state is AdsPageLoading,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  childAspectRatio: 1.9),
              itemCount: cubit.ads?.length,
              itemBuilder: (context, index) =>
                  // children: [

                  GridTile(
                footer: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: GridTileBar(
                      backgroundColor: Colors.white,
                      title: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  width: 100,
                                  height: 35,
                                  color: Colors.redAccent,
                                  child: TextButton(
                                      onPressed: () async {
                                        await DeleteADsCubit.get(context)
                                            .deleteADMethode(
                                                id: cubit.ads?[index].id ?? "");

                                        context.mounted
                                            ? await AdsRepo.getAdsData(query: {
                                                'status':
                                                    widget.selectedIndez == 0
                                                        ? 'pending'
                                                        : 'accepted',
                                              }, context: context)
                                            : null;
                                      },
                                      child: const Text(
                                        textAlign: TextAlign.center,
                                        'حذف',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ))),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 100,
                                height: 35,
                                color: Colors.green,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      textAlign: TextAlign.center,
                                      'المقبولة',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 35,
                                      color: const Color(0xFF2F2F75),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        EditAdsScreen(
                                                          adId: cubit
                                                                  .ads?[index]
                                                                  .id ??
                                                              "",
                                                        )));
                                          },
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            'تعديل',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                child: Container(
                  color: Colors.white,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 70,
                      width: 100,
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
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
                                      const Row(
                                        children: [
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Chip(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              label: Text("..."),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        const Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: Text(
                                            cubit.ads?[index].title ?? "",
                                            textAlign: TextAlign.end,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ),
                                      ]),
                                      // const Divider(),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // const Padding(padding: EdgeInsets.all(5)),
                                      SizedBox(
                                        height: 30,
                                        width: 250,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Chip(
                                                  side: const BorderSide(
                                                      color: Colors.white),
                                                  elevation: 0,
                                                  avatar: Image.asset(
                                                      'assets/images/cat-4.png'),
                                                  label: Text(
                                                    cubit.ads?[index]
                                                            .category ??
                                                        "",
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 90,
                                              child: Chip(
                                                  side: const BorderSide(
                                                      color: Colors.white),
                                                  elevation: 0,
                                                  avatar: Image.asset(
                                                      'assets/images/location.png'),
                                                  label: Text(
                                                    cubit.ads?[index].address ??
                                                        "",
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 120,
                                  width: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      cubit.ads?[index].cover ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Myloading {
  show() {
    return SmartDialog.showLoading(
      builder: (context) => const CircularProgressIndicator(),
    );
  }

  dimiss() {
    return SmartDialog.dismiss();
  }
}

// class GetUerId {
//   String? id;
//   userId() {
//     return BlocProvider(
//       create: (context) => UserCubit()..getaccountDetiles(context),
//       child: BlocConsumer(
//         builder: (context, state) {
//           final cubit2 = UserCubit.get(context);

          
//         },
//         listener: (context, state) {},
//       ),
//     );
//   }
// }
