import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/sources/article_item.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/source.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key});
  List<Source> sources = [
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    Source(
      id: "abc-news",
      name: "ABC News",
      description:
          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
      url: "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us",
    ),
  ];
  List<Article> articles = [
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
    Article(
      source: Source(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us",
      ),
      author: "David Cobb",
      title:
          "Alabama vs. LSU live updates, score, game analysis and highlights - CBS Sports",
      description:
          "Live updates, highlights and analysis as Alabama and LSU clash in prime time in Week 11",
      url:
          "https://www.cbssports.com/college-football/news/alabama-lsu-live-updates-score-results-analysis/live/",
      urlToImage:
          "https://sportshub.cbsistatic.com/i/r/2025/11/09/605c2708-78f4-4e25-a6b2-d8b277517fca/thumbnail/1200x675/77352f4ad9cb31555cbf4d59dfcabd62/alabama-lsu-1.jpg",
      publishedAt: "2025-11-09T02:03:16Z",
      content:
          "No. 4 Alabama is in control of its own destiny as it prepares to host LSU in a rivalry showdown on Saturday. The Crimson Tide (7-5, 5-0 SEC) face a manageable November slate and are on pace to appear… [+1093 chars]",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTabController(
            length: sources.length,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorColor: ColorsManager.white,
              labelPadding: REdgeInsets.only(right: 20),
              isScrollable: true,
              onTap: (value) {},
              tabs: sources
                  .map(
                    (source) => Text(
                      source.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: articles[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              itemCount: articles.length,
            ),
          ),
        ],
      ),
    );
  }
}
