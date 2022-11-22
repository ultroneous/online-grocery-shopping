import 'package:ecomm_bloc/presentation/myorders/orders_page.dart';
import 'package:flutter/material.dart';

import '../../Constants/color.dart';
import '../../api/services/locator.dart';
import '../../constants/images.dart';
import '../../sharedprefs/shared_prefs_helper.dart';
import 'dividerlist.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final prefs = getIt.get<SharedPreferenceHelper>();
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(0.0),
      children: <Widget>[
        SizedBox(
          height: 130,
          child: DrawerHeader(
            decoration: BoxDecoration(
                color: isDarkMode
                    ? Theme.of(context).cardColor
                    : AppColors.commenTextColor),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    //  margin: const EdgeInsets.only(left: 10),
                    height: 40.17,
                    width: 40.17,
                    child: ClipOval(
                      child: Image.asset(
                        ImageName.user,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Hello ${prefs.getValues('name')}",
                    // "Hello, Martin Taylor",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: DividerList(
            sufixicon: ImageName.home,
            title: "Home",

            // prifixicon: ImageName.arrowin,
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const MyordersPage()));
          },
          child: DividerList(
            sufixicon: ImageName.orders,
            title: "My Orders",
            prifixicon: ImageName.arrowin,
          ),
        ),
        const Divider(),
        DividerList(
          sufixicon: ImageName.shear,
          title: "Share Application",

          // prifixicon: ImageName.arrowin,
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            //Get.toNamed(Routes.ADDRESS);
          },
          child: DividerList(
            sufixicon: ImageName.setting,
            title: "Settings",
            prifixicon: ImageName.arrowin,
          ),
        ),
        const Divider(),
        DividerList(
          sufixicon: ImageName.help,
          title: "Help",

          //  prifixicon: ImageName.arrowin,
        ),
        const Divider(),
        DividerList(
          sufixicon: ImageName.setting,
          title: "About",

          // prifixicon: ImageName.arrowin,
        ),
        const Divider(),
        DividerList(
          sufixicon: ImageName.faq,
          title: "FAQ",

          //  prifixicon: ImageName.arrowin,
        ),
        const Divider(),
      ],
    ));
  }
}
