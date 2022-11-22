import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Constants/color.dart';

class DividerList extends StatelessWidget {
  const DividerList(
      {Key? key, required this.sufixicon, required this.title, this.prifixicon})
      : super(key: key);
  final String sufixicon;
  final String title;
  final String? prifixicon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: SvgPicture.asset(
        sufixicon,
        width: 21,
        color: isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
      ),
      title: Text(title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? AppColors.simplewhite
                  : AppColors.commenTextColor)),
      trailing: prifixicon == null
          ? const Text("")
          : SvgPicture.asset(
              prifixicon!,
              color: isDarkMode
                  ? AppColors.simplewhite
                  : AppColors.commenTextColor,
            ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SvgPicture.asset(
    //         sufixicon,
    //         width: 15,
    //         color: AppColors.commenTextColor,
    //       ),
    //       Spacer(
    //         flex: 1,
    //       ),
    //       Text(title,
    //           style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w500,
    //               color: AppColors.commenTextColor)),
    //       Spacer(
    //         flex: 6,
    //       ),
    //       prifixicon == null ? Text("") : SvgPicture.asset(prifixicon!)
    //     ],
    //   ),
    // );
  }
}
