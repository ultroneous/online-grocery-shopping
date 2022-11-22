import 'package:ecomm_bloc/bloc/myorder/myorder_cubit.dart';
import 'package:ecomm_bloc/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyordersPage extends StatefulWidget {
  const MyordersPage({Key? key}) : super(key: key);

  @override
  State<MyordersPage> createState() => _MyordersPageState();
}

class _MyordersPageState extends State<MyordersPage> {
  late MyorderCubit _myorderCubit;
  @override
  void initState() {
    super.initState();
    _myorderCubit = BlocProvider.of<MyorderCubit>(context);
    _myorderCubit.getmyorder();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Spacer(flex: 3),
                    Text(
                      "My Orders",
                      style: TextStyle(
                          fontSize: 20,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(flex: 4),
                  ],
                ),
                BlocBuilder<MyorderCubit, MyorderState>(
                    builder: (context, state) {
                  if (state is MyorderSuccess) {
                    return myorder(state);
                  } else if (state is MyorderInitial) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Color(0xFF082A4F)));
                  } else {
                    return const Center(
                      child: Text(
                        "No products available for this category",
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget myorder(MyorderSuccess state) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: Column(
          children: List.generate(state.values.length, (index) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  state.values[index].orderedDate.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? Colors.white
                          : AppColors.commenTextColor),
                ),
                const Spacer(),
                Text(
                  "Order Id :567877",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? Colors.white
                          : AppColors.commenTextColor),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
                children: List.generate(
                    state.values[index].orderedItems!.length, (i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 62,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(children: [
                    SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.network(state
                            .values[index].orderedItems![i].itemId!.image![0]
                            .toString())),
                    const Spacer(flex: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.values[index].orderedItems![i].itemId!.name
                              .toString(),
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : AppColors.commenTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '\$${state.values[index].orderedItems![i].itemId!.price}',
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.redcommen,
                                fontWeight: FontWeight.bold),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '/kg',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Container(
                      height: 25,
                      width: 82,
                      decoration: BoxDecoration(
                          color: AppColors.redcommen,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                          child: Text("View Details",
                              style: TextStyle(fontSize: 10))),
                    )
                  ]),
                ),
              );
            }))
          ],
        );
      })),
    );
  }
}
