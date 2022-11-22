import 'package:ecomm_bloc/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoriesShimmer extends StatelessWidget {
  const SubCategoriesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        const SizedBox(height: 30),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 1 / 1.3,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor:
                    isDarkMode ? const Color(0xFF1F1F30) : Colors.grey.shade300,
                highlightColor:
                    isDarkMode ? const Color(0xFF302F49) : Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(6)),
                ),
              );
            }),
      ],
    );
  }
}
