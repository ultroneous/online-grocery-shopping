import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm_bloc/bloc/categories/categories_cubit.dart';
import 'package:ecomm_bloc/bloc/categories/categories_state.dart';
import 'package:ecomm_bloc/bloc/subcategory/subcategory_bloc.dart';
import 'package:ecomm_bloc/presentation/home/shimmerloader/subcategories_shimmer.dart';
import 'package:ecomm_bloc/presentation/home/widgets/categoriesslider_view.dart';
import 'package:ecomm_bloc/presentation/home/widgets/vegetable_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants/color.dart';
import '../common/appbar.dart';
import 'shimmerloader/categories_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CategoriesCubit _categoriesCubit;
  late SubcategoryBloc _subcategoryBloc;
  @override
  void initState() {
    super.initState();
    _categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    _categoriesCubit.requestCategories();
    _subcategoryBloc = BlocProvider.of<SubcategoryBloc>(context);
    _subcategoryBloc.add(PassidEvent("61f0018a0dc3bfa998d62ac7"));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const AppBarView(),

      body: RefreshIndicator(
        onRefresh: () async {
          _categoriesCubit.requestCategories();
          _subcategoryBloc.add(PassidEvent("61f0018a0dc3bfa998d62ac7"));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 99),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Deal",
                  style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode
                          ? AppColors.simplewhite
                          : AppColors.commenTextColor,
                      fontWeight: FontWeight.w700),
                ),
                Column(
                  children: [
                    CarouselSlider(
                        items: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            // height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "assets/images/offer.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 8,
                          viewportFraction: 1,
                          // onPageChanged: (index, reason) {

                          //     _current = index;

                          // }
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor),
                    ),
                    Text(
                      "Show All",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                _getCategories(),

                const SizedBox(
                  height: 25,
                ),
                _getSubCategories(),

                const SizedBox(
                  height: 20,
                ),
                //    VegetableGrid(),
                const SizedBox(
                  height: 25,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Fruits",
                //       style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w700,
                //           color: AppColors.commenTextColor),
                //     ),
                //     Text(
                //       "Show All",
                //       style: TextStyle(
                //           fontSize: 10,
                //           fontWeight: FontWeight.w400,
                //           color: AppColors.commenTextColor),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),

      //  )
    );
  }

  Widget _getCategories() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
      if (state is CategoriesSuccess) {
        return SizedBox(
            height: 75,
            child: CategoriesSlider(
              data: state.category,
            ));
      } else if (state is CategoriesLoading) {
        return const SizedBox(height: 75, child: CategoriesShimmer());
      } else {
        return const Text(
          "No products available for this category",
        );
      }
    });
  }

  Widget _getSubCategories() {
    return BlocBuilder<SubcategoryBloc, SubcategoryState>(
        builder: (context, state) {
      if (state is SubcategorySuccess) {
        return VegetableGrid(
          data: state.subCategory,
        );
      } else if (state is SubcategoryLoading) {
        return const SubCategoriesShimmer();
      } else {
        return const Center(
          child: Text(
            "No products available for this category",
          ),
        );
      }
    });
  }
}
