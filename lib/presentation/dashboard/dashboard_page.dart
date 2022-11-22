import 'package:ecomm_bloc/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../constants/images.dart';
import '../cart/cart_page.dart';
import '../common/bottombar.dart';
import '../common/drawermanu.dart';
import '../home/menu_page.dart';
import '../home/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var tabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> viewContainer = [
    const HomePage(),
    const MenuPage(),
    const CartPage(),
    const CartPage(),
    ProfilePage()
  ];
  void changeTabIndex(int index) {
    tabIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          changeTabIndex(0);
        });
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerMenu(),
        body: Stack(
          children: [
            viewContainer[tabIndex],
            Positioned(
              bottom: -1,
              left: 0,
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: BottomNav(
                  index: tabIndex,
                  labelStyle: LabelStyle(showOnSelect: true),
                  iconStyle: IconStyle(onSelectColor: Colors.white),
                  items: [
                    BottomNavItem(ImageName.home, label: 'Home'),
                    BottomNavItem(ImageName.menu, label: 'Menu'),
                    BottomNavItem(ImageName.dammy, label: 'Menu'),
                    BottomNavItem(ImageName.favret, label: 'favret'),
                    BottomNavItem(ImageName.users, label: 'User')
                  ],
                  onTap: (index) {
                    setState(() {
                      changeTabIndex(index);
                    });
                  },
                ),
              ),
            ),
            tabIndex == 0 || tabIndex == 1
                ? Positioned(
                    top: 40,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        color: Colors.transparent,
                      ),
                    ))
                : Container(),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(
                                    width: 1.5,
                                    color: AppColors.commenTextColor),
                              ),
                              child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      changeTabIndex(2);
                                    });
                                  },
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: AppColors.commenTextColor,
                                    size: 30,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 5),
                              child: Text("",
                                  style: TextStyle(
                                      color: AppColors.commenTextColor)),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            // Visibility(visible: controller.visible, child: DrawerMenu()),
          ],
        ),
      ),
    );
  }
}
