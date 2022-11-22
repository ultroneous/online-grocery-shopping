import 'package:flutter/material.dart';

import '../../constants/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.tapActivity})
      : super(key: key);
  final String title;
  final Function() tapActivity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width - 45,
      decoration: BoxDecoration(
          color: AppColors.redcommen, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: tapActivity,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
