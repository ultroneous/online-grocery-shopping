import 'package:ecomm_bloc/api/models/categories_model.dart';
import 'package:ecomm_bloc/bloc/subcategory/subcategory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/color.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CategoriesModel info;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              SubcategoryBloc subcategoryBloc =
                  BlocProvider.of<SubcategoryBloc>(context);
              subcategoryBloc.add(PassidEvent(info.id));
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                  child: Image.network(
                info.image![0].toString(),
                height: 30,
                width: 35,
                fit: BoxFit.fill,
              )),
            ),
          ),
        ),
        Text(
          info.name.toString(),
          style: TextStyle(
              color: isDarkMode ? Colors.white : AppColors.commenTextColor,
              fontSize: 8,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class CategoriesSlider extends StatelessWidget {
  List<CategoriesModel> data;
  CategoriesSlider({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => Categories(info: data[index]));
  }
}
