import 'package:flutter/material.dart';
import 'package:news_app/views/news_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future init() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, NewsView.routeName);
  }
  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/newsifyicon.png"),
      ),
    );
  }
}