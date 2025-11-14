import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.onClicked,
  });
  final CategoryModel category;
  final void Function()? onClicked;
  @override
  Widget build(BuildContext context) {
    final providerConfig = Provider.of<ConfigProvider>(context);
    final providerHome = Provider.of<HomeProvider>(context);

    return Container(
      height: 198.04.h,
      width: 363.w,
      decoration: BoxDecoration(
        color: providerConfig.isDark ? ColorsManager.white : ColorsManager.black,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        spacing: 22.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(24.r),
            child: Image.asset(
              category.imagePath,
              width: 150.w,
              height: 198.04.h,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                 providerHome.getLocalizedCategoryTitle(context,category.title),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge,
                ),
                InkWell(
                  onTap: onClicked,
                  child: Container(
                    margin: REdgeInsets.only(right: 10, top: 10,left: 10),
                    decoration: BoxDecoration(
                      color: ColorsManager.grey,
                      borderRadius: BorderRadius.circular(84.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          S.of(context).view_all,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        FloatingActionButton(
                          heroTag: null,
                          mini: true,
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
