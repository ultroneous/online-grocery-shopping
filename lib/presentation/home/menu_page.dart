import 'package:ecomm_bloc/api/models/categories_model.dart';
import 'package:ecomm_bloc/bloc/categories/categories_cubit.dart';
import 'package:ecomm_bloc/bloc/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/subcategory/subcategory_bloc.dart';
import '../common/appbar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: const AppBarView(),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
              if (state is CategoriesSuccess) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: _categoriesGrid(state.category),
                ));
              } else if (state is SubcategoryLoading) {
                return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF082A4F)));
              } else {
                return const Center(
                  child: Text("No products available"),
                );
              }
            })

            //  )
            ));
  }

  Widget _categoriesGrid(List<CategoriesModel> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.1 / 1.1,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              heightFactor: 1.6,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data[index].image![0]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
