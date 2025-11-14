import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/categories/category_item.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, this.onClicked});
  final void Function()? onClicked;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${S.of(context).good_morning}\n${S.of(context).here_is_some_news_for_you}',
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
                onClicked: () {
                  provider.goToSources(
                    CategoryModel.categories[index],
                    context,
                  );
                },
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
