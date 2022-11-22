import 'package:ecomm_bloc/presentation/common/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constants/color.dart';
import '../../bloc/orderplace/placeorder_bloc.dart';
import '../../constants/images.dart';
import '../custom/custome_button.dart';
import 'ordersuccess_page.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key, required this.orderedItems, required this.uid})
      : super(key: key);
  List orderedItems;
  String uid;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocListener<PlaceorderBloc, PlaceorderState>(
        listener: (context, state) {
          if (state is OrderPlaceLoading) {
            ProgressDialog.show(context);
          } else if (state is OrderPlaceSuccess) {
            ProgressDialog.hide(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const OrdersuccessPage()));
          } else if (state is OrdePlaceError) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: state.exception.toString(),
                backgroundColor: AppColors.redcommen);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: isDarkMode
                                ? AppColors.simplewhite
                                : AppColors.commenTextColor,
                          )),
                      const Spacer(
                        flex: 4,
                      ),
                      Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode
                                ? AppColors.simplewhite
                                : AppColors.commenTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(
                        flex: 6,
                      ),
                    ],
                  ),
                ),
                deliveryTitle(context),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 9, bottom: 9),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImageName.location,
                        color: isDarkMode
                            ? AppColors.subtextdark
                            : AppColors.subtextlight,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Text(
                          'Floor 4,Wakil Tower,Ta 131 Gulshan Badda Link Road',
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode
                                ? AppColors.subtextdark
                                : AppColors.subtextlight,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                deliveryItem(context, 'Order Item', '3'),
                const Divider(),
                deliveryItem(context, 'Sub Total Cost', '\$34'),
                const Divider(),
                deliveryItem(context, 'Delivery Charge', '\$1'),
                const Divider(),
                deliveryItem(context, 'Total', '\$35'),
                const Divider(),
                deliveryItem(context, 'Payment  Method', 'Cash on Delivery'),
                termsDetail(context),
                const SizedBox(
                  height: 99,
                ),
                Center(
                  child: CustomButton(
                    tapActivity: () {
                      PlaceorderBloc orderBloc =
                          BlocProvider.of<PlaceorderBloc>(context);
                      orderBloc.add(OrderplaceEvent(orderedItems, uid, 4, 45));
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             const OrdersuccessPage()));
                    },
                    title: "Place Order",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget deliveryTitle(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Delivery",
            style: TextStyle(
                fontSize: 14,
                color: isDarkMode
                    ? AppColors.simplewhite
                    : AppColors.commenTextColor,
                fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Change",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.redcommen,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget deliveryItem(BuildContext context, String title, String cost) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: isDarkMode
                    ? AppColors.simplewhite
                    : AppColors.commenTextColor,
                fontWeight: FontWeight.w700),
          ),
          Text(
            cost,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color:
                  isDarkMode ? AppColors.subtextdark : AppColors.subtextlight,
            ),
          ),
        ],
      ),
    );
  }

  Widget termsDetail(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'By placing an order you agree to our',
            style: TextStyle(
                fontSize: 14,
                color: isDarkMode
                    ? AppColors.subtextdark
                    : AppColors.subtextlight),
          ),
          GestureDetector(
            onTap: () {
              // Get.toNamed(Routes.TERMS);
            },
            child: Text(
              'Terms & Conditions',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? AppColors.simplewhite
                      : AppColors.commenTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
