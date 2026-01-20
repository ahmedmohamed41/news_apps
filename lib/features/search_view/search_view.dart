import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/data_sources_impl/sources_api_data_sources.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/features/home/sources_view/article_item.dart';
import 'package:news_app/features/search_view/search_view_model.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerConfig = Provider.of<ConfigProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(
        sourcesRepositoryImpl: SourcesRepositoryImpl(
          sourcesDataSources: SourcesApiDataSources(apiService: ApiService()),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<SearchViewModel>(
                  builder: (context, searchViewModel, child) {
                    return TextField(
                      onChanged: (value) {
                        searchViewModel.fetchSearchArticles(value);
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            CupertinoIcons.xmark,
                          ),
                          onPressed: () {
                            searchViewModel.fetchSearchArticles("");
                            controller.clear();
                          },
                        ),

                        labelText: S.of(context).search,
                        hintText: S.of(context).search,
                      ),
                    );
                  },
                ),

                Consumer<SearchViewModel>(
                  builder: (context, searchViewModel, child) {
                    if (searchViewModel.isLoading) {
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
                    if (searchViewModel.articles.isEmpty &&
                        searchViewModel.errorMessage == null) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            S.of(context).no_search,
                          ),
                        ),
                      );
                    }
                    if (searchViewModel.errorMessage != null) {
                      return Expanded(
                        child: Center(
                          child: Text(searchViewModel.errorMessage!),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showBottomSheet(
                              context,
                              searchViewModel.articles[index],
                            );
                          },
                          child: ArticleItem(
                            article: searchViewModel.articles[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.h,
                        ),
                        itemCount: searchViewModel.articles.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
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
