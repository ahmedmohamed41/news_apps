import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/categories/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key,  this.onClicked});
  final void Function()? onClicked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: CategoryModel.categories.length,
              itemBuilder: (context, index) => CategoryItem(
                onClicked:onClicked ,
                category: CategoryModel.categories[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 15.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
