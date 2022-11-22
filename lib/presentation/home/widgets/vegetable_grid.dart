import 'package:ecomm_bloc/api/models/subcategory_model.dart';
import 'package:ecomm_bloc/bloc/addtocart/addcart_bloc.dart';
import 'package:ecomm_bloc/constants/color.dart';
import 'package:ecomm_bloc/presentation/productdetails/productdetails_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class VegetablesView extends StatelessWidget {
  const VegetablesView({
    Key? key,
    required this.info,
  }) : super(key: key);

  final SubCategoryModel info;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProductDetails(
                      id: info.id!,
                      categoryname: info.parentCategoryId!.name.toString(),
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Text(
                    info.name!,
                    style: TextStyle(
                        color: isDarkMode
                            ? Colors.white
                            : AppColors.commenTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Center(
              heightFactor: 1.6,
              child: Container(
                height: 40.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(info.image![0]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    height: 33,
                    width: 68,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'weight ',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: isDarkMode
                                      ? Colors.white
                                      : AppColors.commenTextColor),
                              children: [
                                TextSpan(
                                    text: info.measurements,
                                    style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold)),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: '\$${info.price}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: isDarkMode
                                      ? Colors.white
                                      : AppColors.commenTextColor,
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
                        ),
                      ],
                    )),
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isDarkMode
                            ? Colors.white
                            : AppColors.commenTextColor),
                    child: IconButton(
                      onPressed: () {
                        // print(info.id!);
                        AddcartBloc addcartBloc =
                            BlocProvider.of<AddcartBloc>(context);
                        addcartBloc.add(AddtoCartEvent(info.id!, true));
                      },
                      icon: SvgPicture.asset(
                        "assets/images/svg/add.svg",
                        width: 20,
                        color: isDarkMode
                            ? AppColors.commenTextColor
                            : Colors.white,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VegetableGrid extends StatelessWidget {
  VegetableGrid(
      {Key? key,
      this.count,
      this.crossAxisCount = 3,
      this.childAspectRatio = 1 / 1.3,
      required this.data})
      : super(key: key);
  final int? count;
  final int crossAxisCount;
  final double childAspectRatio;
  List<SubCategoryModel> data;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data[0].parentCategoryId!.name.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isDarkMode
                    ? AppColors.simplewhite
                    : AppColors.commenTextColor,
              ),
            ),
            Text(
              "Show All",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? Colors.white : AppColors.commenTextColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) => VegetablesView(info: data[index]),
        ),
      ],
    );
  }
}
