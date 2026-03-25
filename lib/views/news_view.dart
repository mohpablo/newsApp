import 'package:flutter/material.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/screen_size.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/widgets/article_widget.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});
  static const routeName = '/news';

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<String> categories = [
    "general",
    "Science",
    "Sports",
    "Technology",
    "Business",
    "Entertainment",
    "Health",
  ];
  int category = 0;
  @override
  Widget build(BuildContext context) {
    ScreenSize.initial(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 249, 249, 1),
      appBar: AppBar(
        title: Text(
          "Newsify",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenSize.height / 30,
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: NewsServices().getArticles(category: categories[category]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(ScreenSize.width / 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Breaking news",
                    style: TextStyle(
                      fontSize: ScreenSize.height / 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot.data![0].urlToImage,
                      width: ScreenSize.width,
                      height: ScreenSize.height / 5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height / 90),
                  SizedBox(
                    height: ScreenSize.height / 22,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return OutlinedButton(
                          onPressed: () {
                            setState(() {
                              category = index;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: category == index
                                ? Color(0xff1948f0)
                                : Colors.white,
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            index == 0 ? "All" : categories[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                    ),
                  ),
                  SizedBox(height: ScreenSize.height / 90),
                  Text(
                    "News for you",
                    style: TextStyle(
                      fontSize: ScreenSize.height / 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height / 90),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            ArticleView.routeName,
                            arguments: snapshot.data![index],
                          ),
                          child: ArticleWidget(
                            articleModel: snapshot.data![index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("No news found"));
          }
        },
      ),
    );
  }
}
