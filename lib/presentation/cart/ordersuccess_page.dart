import 'package:flutter/material.dart';

import '../../Constants/color.dart';
import '../custom/custome_button.dart';

class OrdersuccessPage extends StatelessWidget {
  const OrdersuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.commenTextColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 107,
                width: 107,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: AppColors.redcommen),
                child: const Icon(
                  Icons.done,
                  size: 55,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Successfully Order',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Order Id Number : 1234567',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Thank you for your order.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your order will prepared and shipped soon.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              CustomButton(
                tapActivity: () {
                  //  Get.toNamed(Routes.ORDERSUMMARY);
                },
                title: "Track Order",
              ),
              const SizedBox(
                height: 99,
              )
            ],
          ),
        ),
      ),
    );
  }
}
