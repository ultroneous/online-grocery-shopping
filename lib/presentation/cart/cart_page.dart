// ignore_for_file: must_be_immutable

import 'package:ecomm_bloc/bloc/getcart/getcart_cubit.dart';
import 'package:ecomm_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants/color.dart';
import '../../api/models/cart_item_model.dart';
import '../../bloc/addtocart/addcart_bloc.dart';
import '../custom/custome_button.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late GetcartCubit _getcartCubit;
  late AddcartBloc _addcartBloc;
  Map<String, dynamic> items = <String, dynamic>{};
  final orderedItem = [];
  @override
  void initState() {
    super.initState();
    _getcartCubit = BlocProvider.of<GetcartCubit>(context);
    _getcartCubit.requestCartdata();
    _addcartBloc = BlocProvider.of<AddcartBloc>(context);
  }

  String _getTotalCart(List<CartItem> cartItem) {
    var sum = 0;
    for (var e in cartItem) {
      sum += ((e.itemQuantity ?? 1) * (e.itemId!.price ?? 0));
    }
    return sum.toString();
  }

  void _getmap(List<CartItem> cartItem) {
    orderedItem.clear();
    for (var element in cartItem) {
      orderedItem.add({
        "itemId": element.itemId!.id.toString(),
        "itemQuantity": element.itemQuantity,
      });
    }
    // print(orderedItem);
  }

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<GetcartCubit, GetcartState>(builder: (context, state) {
      if (state is GetcartSuccess) {
        return getItem(state);
      } else if (state is GetcartLoading) {
        return const Center(
            child: CircularProgressIndicator(color: Color(0xFF082A4F)));
      } else {
        return const Center(
          child: Text(
            "No products available for this category",
          ),
        );
      }
    });
  }

  Widget getItem(GetcartSuccess state) {
    _getmap(state.values.cartItems!);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return state.values.cartItems!.isEmpty
        ? Center(
            child: Icon(
            Icons.remove_shopping_cart_outlined,
            color:
                isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
            size: 90,
          ))
        : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                          fontSize: 20,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: state.values.cartItems!
                        .map((d) => generateCart(context, d)
                            // Center(child: Text(d.itemId!.name.toString()))
                            )
                        .toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20),
                    height: 99,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Sub Total Cost ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: isDarkMode
                                      ? AppColors.simplewhite
                                      : AppColors.commenTextColor,
                                  fontSize: 14),
                            ),
                            Text(
                              "Delivery Charge",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: isDarkMode
                                      ? AppColors.simplewhite
                                      : AppColors.commenTextColor,
                                  fontSize: 14),
                            ),
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: isDarkMode
                                      ? AppColors.simplewhite
                                      : AppColors.commenTextColor,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        const Spacer(
                          flex: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _getTotalCart(state.values.cartItems!),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? AppColors.subtextdark
                                      : AppColors.subtextlight,
                                  fontSize: 14),
                            ),
                            Text(
                              "\$0",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? AppColors.subtextdark
                                      : AppColors.subtextlight,
                                  fontSize: 14),
                            ),
                            Text(
                              _getTotalCart(state.values.cartItems!),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? AppColors.subtextdark
                                      : AppColors.subtextlight,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const DashboardPage()));
                    },
                    child: Text(
                      "Continue Shopping",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomButton(
                      title: "Checkout",
                      tapActivity: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => CheckoutPage(
                                      orderedItems: orderedItem,
                                      uid: state.values.userId.toString(),
                                    )));
                      }),
                  const SizedBox(height: 115),
                ],
              ),
            ),
          );
  }

  Widget generateCart(BuildContext context, CartItem val) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 14),
      child: Container(
        height: 99,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 85,
                    height: 83,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                val.itemId!.image![0].toString()))),
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    val.itemId!.name.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode
                            ? AppColors.simplewhite
                            : AppColors.commenTextColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'weight ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight),
                      children: <TextSpan>[
                        TextSpan(
                            text: val.itemId!.measurements,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _addcartBloc.add(
                              AddtoCartEvent(val.itemId!.id.toString(), false));
                          _getcartCubit.requestCartdata();
                        },
                        child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.simplewhite),
                            child: Icon(
                              Icons.remove_outlined,
                              size: 10,
                              color: AppColors.commenTextColor,
                            )),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        val.itemQuantity.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? AppColors.simplewhite
                                : AppColors.commenTextColor),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          _addcartBloc.add(
                              AddtoCartEvent(val.itemId!.id.toString(), true));
                          _getcartCubit.requestCartdata();
                        },
                        child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.simplewhite),
                            child: Icon(
                              Icons.add,
                              size: 10,
                              color: AppColors.commenTextColor,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _addcartBloc.add(ItemRemove(val.itemId!.id.toString()));
                      _getcartCubit.requestCartdata();
                    },
                    child: Icon(
                      Icons.close,
                      size: 15,
                      color: isDarkMode
                          ? AppColors.simplewhite
                          : AppColors.commenTextColor,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$${val.itemId!.price.toString()}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? AppColors.simplewhite
                            : AppColors.commenTextColor,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '/kg',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
