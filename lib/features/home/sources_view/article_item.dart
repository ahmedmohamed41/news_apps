import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16.r),
        border: Border.all(
          width: 1,
          color: configProvider.isDark
              ? ColorsManager.white
              : ColorsManager.black,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By:${article.author ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const Spacer(),
              Text(
                timeago.format(DateTime.parse(article.publishedAt ?? '')),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // String timeAgoFromString(String timeString) {
  //   final dateTime = DateTime.parse(timeString);
  //   return timeago.format(dateTime);
  // }
}
