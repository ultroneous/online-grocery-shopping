import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants/color.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor:
                isDarkMode ? const Color(0xFF1F1F30) : Colors.grey.shade300,
            highlightColor:
                isDarkMode ? const Color(0xFF302F49) : Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                Container(
                  height: 5,
                  width: 40,
                  color: Colors.white,
                )
              ],
            ),
          );
        });
  }
}
