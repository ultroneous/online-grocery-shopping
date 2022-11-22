import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Constants/color.dart';
import '../../constants/images.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Icon(
        Icons.menu_outlined,
        size: 30,
        color: isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
      ),
      title: SizedBox(
        width: 170,
        child: Text(
          "Find the Right One For A Healthy Body",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color:
                isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
          ),
          maxLines: 2,
        ),
      ),
      actions: [
        Container(
            margin: const EdgeInsets.all(9),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
            ),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  ImageName.notifiction1,
                  color: isDarkMode
                      ? AppColors.simplewhite
                      : AppColors.commenTextColor,
                  width: 15,
                ))),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
               // Get.toNamed(Routes.SEARCH);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).cardColor),
                // color: Colors.white,
                height: 40,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Icon(Icons.search,
                        color: isDarkMode
                            ? AppColors.subtextdark
                            : AppColors.subtextlight),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 11,
                    )
                  ],
                ),

                // child: TextField(
                //   cursorColor: AppColors.commenTextColor,
                //   style: TextStyle(color: AppColors.commenTextColor),
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Theme.of(context).cardColor,
                //     focusColor: AppColors.commenTextColor,
                //     hintText: 'Search',
                //     hintStyle: TextStyle(
                //         fontSize: 16.0,
                //         color: isDarkMode
                //             ? AppColors.subtextdark
                //             : AppColors.subtextlight,
                //         fontWeight: FontWeight.w500),
                //     prefixIcon: Icon(Icons.search,
                //         color: isDarkMode
                //             ? AppColors.subtextdark
                //             : AppColors.subtextlight),
                //     contentPadding:
                //         const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(6.0),
                //       borderSide: const BorderSide(
                //         width: 0,
                //         style: BorderStyle.none,
                //       ),
                //     ),
                //   ),
                // )
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    ImageName.shorting,
                    width: 20,
                    color: isDarkMode
                        ? AppColors.simplewhite
                        : AppColors.commenTextColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(110);
}
