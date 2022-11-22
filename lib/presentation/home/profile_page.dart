import 'package:ecomm_bloc/presentation/Auth/changepassword_page.dart';
import 'package:ecomm_bloc/presentation/Auth/login_page.dart';
import 'package:ecomm_bloc/presentation/editprofile/editprofile_page.dart';
import 'package:flutter/material.dart';

import '../../Constants/color.dart';
import '../../api/services/locator.dart';
import '../../constants/images.dart';
import '../../sharedprefs/shared_prefs_helper.dart';
import '../common/dividerlist.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final _prefs = getIt.get<SharedPreferenceHelper>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Center(
                child: Text(
                  "My Account",
                  style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode
                          ? AppColors.simplewhite
                          : AppColors.commenTextColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 80.17,
                  width: 80.17,
                  child: ClipOval(
                    child: Image.asset(
                      ImageName.user,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _prefs.getValues('name').toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      _prefs.getValues('email').toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode
                            ? AppColors.subtextdark
                            : AppColors.subtextlight,
                      ),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const EditprofilePage()));
              },
              child: DividerList(
                sufixicon: ImageName.edit,
                title: "Edit Profile",
                prifixicon: ImageName.arrowin,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.OTP);
              },
              child: DividerList(
                sufixicon: ImageName.bell,
                title: "Notification",

                //  prifixicon: ImageName.arrowin,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChangepasswordPage()));
              },
              child: DividerList(
                sufixicon: ImageName.unlock,
                title: "Change Password",
                // prifixicon: ImageName.arrowin,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.TERMS);
              },
              child: DividerList(
                sufixicon: ImageName.file,
                title: "Terms & Conditions",
                // prifixicon: ImageName.arrowin,
              ),
            ),
            const Divider(),
            DividerList(
              sufixicon: ImageName.privacy,
              title: "Privacy Policy",
              // prifixicon: ImageName.arrowin,
            ),
            const Divider(),
            _prefs.getValues('token') != null
                ? GestureDetector(
                    onTap: () {
                      _prefs.deleteValues(key: 'token');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginPage()));
                    },
                    child: DividerList(
                      sufixicon: ImageName.logout,
                      title: "Log out",
                      // prifixicon: ImageName.arrowin,
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: DividerList(
                      sufixicon: ImageName.logout,
                      title: "Login",
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
