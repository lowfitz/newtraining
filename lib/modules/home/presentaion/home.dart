import 'package:flutter/material.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/modules/account/presentation/acount_screen.dart';
import 'package:new_bussiness_app/modules/account/presentation/loggedin_acount.dart';
import 'package:new_bussiness_app/modules/add_ads/presentaion/add_ads.dart';
import 'package:new_bussiness_app/modules/ads/ads_screen.dart';
import 'package:new_bussiness_app/modules/categories/presentaion/categories.dart';
import 'package:new_bussiness_app/modules/home/presentaion/home_screen.dart';
import 'package:new_bussiness_app/widgets/src/models/bottom_bar_item_model.dart';
import 'package:new_bussiness_app/widgets/src/notch_bottom_bar.dart';
import 'package:new_bussiness_app/widgets/src/notch_bottom_bar_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _pageController;
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;
  @override
  void initState() {
    _pageController = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const Ads(),
    const AddAds(),
    const CategoriesScreen(),
    Utils.token == "" ? const Account() : const LoggedInAccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF2F2F75),
            title: SizedBox(
                height: 30, child: Image.asset('assets/images/logo.png'))
            // const Text(
            //   'Business Station',
            //   style: TextStyle(color: Colors.white),
            // ),
            ),
        bottomNavigationBar: bottomBarPages.length <= maxCount
            ? SizedBox(
                height: 100,
                child: AnimatedNotchBottomBar(
                  blurOpacity: 1,
                  showBlurBottomBar: true,
                  color: const Color(0xFF2F2F75),
                  notchBottomBarController: _controller,
                  onTap: (index) {
                    /// perform action on tab change and to update pages you can update pages without pages
                    // ignore: avoid_print
                    if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAds()));

                      return;
                    }
                    _pageController.animateTo(
                      (index),
                    );
                  },
                  bottomBarItems: const [
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.home_filled,
                        color: Color(0xFF2F2F75),
                      ),
                      itemLabel: 'Home',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.ads_click_outlined,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.ads_click,
                        color: Color(0xFF2F2F75),
                      ),
                      itemLabel: 'Ads',
                    ),

                    ///svg example
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.add,
                        color: Color(0xFF2F2F75),
                      ),
                      itemLabel: 'ADD',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.settings,
                        color: Color(0xFF2F2F75),
                      ),
                      itemLabel: 'Category',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.person_sharp,
                        color: Color(0xFF2F2F75),
                      ),
                      itemLabel: '  Account',
                    ),
                  ],
                ),
              )
            : null,
        body: TabBarView(
          controller: _pageController,
          children: bottomBarPages,
        ));
  }

  selectedScreen(index) {
    StatefulWidget selectedScreen;
    if (index == 0) {
      selectedScreen = const HomeScreen();
    } else if (index == 1) {
      selectedScreen = const Ads();
    } else if (index == 2) {
      selectedScreen = const AddAds();
    } else if (index == 3) {
      selectedScreen = const CategoriesScreen();
    } else {
      selectedScreen = const LoggedInAccountScreen();
    }
    return selectedScreen;
  }
  // @override
  // void setState(VoidCallback fn) {
  //   if()
  //   super.setState(fn);
  // }
}
