import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/news_view.dart';
import 'package:news_app/views/splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      SplashView.routeName: (context) => const SplashView(),
      NewsView.routeName: (context) => const NewsView(),
      ArticleView.routeName: (context) => const ArticleView(),
    },
    initialRoute: SplashView.routeName,
    );
  }
}

