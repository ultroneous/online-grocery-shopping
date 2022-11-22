import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm_bloc/api/models/product_details_model.dart';
import 'package:ecomm_bloc/bloc/productdetails/productdetails_cubit.dart';
import 'package:ecomm_bloc/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/color.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.id, required this.categoryname})
      : super(key: key);
  String id, categoryname;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductdetailsCubit _productdetailsCubit;
  @override
  void initState() {
    _productdetailsCubit = BlocProvider.of<ProductdetailsCubit>(context);
    _productdetailsCubit.getdetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
        builder: ((context, state) {
      if (state is ProductdetailsLoading) {
        return const Center(
            child: CircularProgressIndicator(color: Color(0xFF082A4F)));
      } else if (state is ProductdetailsSuccess) {
        return productView(state.details);
      } else {
        return Container();
      }
    }));
  }

  Widget productView(ProductDetailsModel model) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(
                        fontSize: 20,
                        color: isDarkMode
                            ? AppColors.simplewhite
                            : AppColors.commenTextColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SvgPicture.asset(
                    ImageName.favret,
                    color: AppColors.commenTextColor,
                  )
                ],
              ),
              CarouselSlider.builder(
                itemCount: model.image!.length,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 8 / 8,
                    viewportFraction: 1,
                    onPageChanged: (i, reason) {
                      // .current = i.obs;
                      // homescreenbuyerController.passindex(i);
                    }),
                itemBuilder: (context, i, id) {
                  return GestureDetector(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: model.image![0].toString(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                color: AppColors.commenTextColor,
                                value: downloadProgress.progress,
                              ),
                            ),
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // var url = model.image![i];
                    },
                  );
                },
              ),
              Wrap(
                children: List.generate(model.image!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 71,
                      width: 71,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(model.image![index]))),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? Colors.white
                                : AppColors.commenTextColor),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.categoryname,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode ? Colors.white : Colors.black38),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$${model.price.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.redcommen,
                          fontWeight: FontWeight.w700),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '/kg',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.commenTextColor),
              ),
              const SizedBox(height: 20),
              Text(
                model.description!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.commenTextColor),
              )
            ],
          ),
        )),
      ),
    );
  }
}
