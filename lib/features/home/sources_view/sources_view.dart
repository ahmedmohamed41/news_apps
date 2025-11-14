import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/sources_view/article_item.dart';
import 'package:news_app/features/home/sources_view/article_provider.dart';
import 'package:news_app/features/home/sources_view/source_provider.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});
  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourceProvider sourceProvider;
  late ArticleProvider articleProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    sourceProvider = SourceProvider();
    articleProvider = ArticleProvider();
    await sourceProvider.fetchSources(widget.category);
    if (sourceProvider.sources.isNotEmpty) {
      articleProvider.fetchArticles(sourceProvider.sources[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerConfig = Provider.of<ConfigProvider>(context);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: sourceProvider,
          ),
          ChangeNotifierProvider.value(
            value: articleProvider,
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<SourceProvider>(
              builder: (context, sourceProvider, child) {
                if (sourceProvider.isLoading) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      color: providerConfig.isDark
                          ? ColorsManager.white
                          : ColorsManager.black,
                    ),
                  );
                }
                if (sourceProvider.errorMessage != null) {
                  return Center(child: Text(sourceProvider.errorMessage!));
                }
                return DefaultTabController(
                  length: sourceProvider.sources.length,
                  child: TabBar(
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    isScrollable: true,
                    onTap: (index) {
                      articleProvider.fetchArticles(
                        sourceProvider.sources[index],
                      );
                    },
                    tabs: sourceProvider.sources
                        .map(
                          (source) => Tab(
                            text: source.id,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),

            Consumer<ArticleProvider>(
              builder: (context, articleProvider, child) {
                if (articleProvider.isLoading) {
                  return Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: providerConfig.isDark
                            ? ColorsManager.white
                            : ColorsManager.black,
                      ),
                    ),
                  );
                }
                if (articleProvider.errorMessage != null) {
                  return Center(child: Text(articleProvider.errorMessage!));
                }
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ArticleItem(
                      article: articleProvider.articles[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                    itemCount: articleProvider.articles.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
