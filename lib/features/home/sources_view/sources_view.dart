import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/data_sources_impl/article_api_data_sources.dart';
import 'package:news_app/data/data_sources_impl/sources_api_data_sources.dart';
import 'package:news_app/data/repository_impl/article_repository_impl.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/features/home/sources_view/article_item.dart';
import 'package:news_app/features/home/sources_view/article_view_model.dart';
import 'package:news_app/features/home/sources_view/source_view_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});
  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourceViewModel sourceViewModel;
  late ArticleViewModel articleViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    sourceViewModel = SourceViewModel(
      sourcesRepositoryImpl: SourcesRepositoryImpl(
        sourcesDataSources: SourcesApiDataSources(apiService: ApiService()),
      ),
    );
    articleViewModel = ArticleViewModel(
      articleRepositoryImpl: ArticleRepositoryImpl(
        articleDataSources: ArticleApiDataSources(apiService: ApiService()),
      ),
    );
    await sourceViewModel.fetchSources(widget.category);
    if (sourceViewModel.sources.isNotEmpty) {
      articleViewModel.fetchArticles(sourceViewModel.sources[0]);
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
            value: sourceViewModel,
          ),
          ChangeNotifierProvider.value(
            value: articleViewModel,
          ),
        ],
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<SourceViewModel>(
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
                      articleViewModel.fetchArticles(
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
            Consumer<ArticleViewModel>(
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
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        showBottomSheet(
                          context,
                          articleProvider.articles[index],
                        );
                      },
                      child: ArticleItem(
                        article: articleProvider.articles[index],
                      ),
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

  void showBottomSheet(BuildContext context, Articles article) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: REdgeInsets.only(left: 8, right: 8, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: REdgeInsets.all(8),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: article.urlToImage ?? '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  article.title ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: ColorsManager.black),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    backgroundColor: ColorsManager.black,
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse(article.url ?? ''));
                  },
                  child: Text(
                    'View Full Articel',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
