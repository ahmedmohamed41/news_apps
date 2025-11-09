import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories/category_view.dart';
import 'package:news_app/features/home/home_drawer/home_drawer.dart';
import 'package:news_app/features/home/sources/sources_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget homeView = CategoryView(
    onClicked: goToSources,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: HomeDrawer(
        onClicked: goToHome,
      ),
      body: homeView,
    );
  }

  void goToSources() {
    setState(() {
      homeView = SourcesView();
    });
  }

  void goToHome() {
    setState(() {
      homeView = CategoryView(
        onClicked: goToSources,
      );
      Navigator.pop(context);
    });
  }
}
