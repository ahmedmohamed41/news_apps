import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16.r),
        border: Border.all(
          width: 1,
          color: ColorsManager.white,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child: Image.network(article.urlToImage),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                'By:${article.author}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              Text(
                'By:${article.publishedAt}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
