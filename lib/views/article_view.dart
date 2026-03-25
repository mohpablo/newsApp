import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/screen_size.dart';
import 'package:news_app/widgets/article_author.dart';


class ArticleView extends StatelessWidget {
  const ArticleView({super.key});
  static const routeName = '/article';
  @override
  Widget build(BuildContext context) {
    ArticleModel articleModel =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    ScreenSize.initial(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 249, 249, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(250, 249, 249, 1),
        title: Text(
          "News Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenSize.height / 40,
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.width / 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                articleModel.urlToImage,
                width: ScreenSize.width,
                height: ScreenSize.height / 4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: ScreenSize.width / 45),
            ArticleAuthor(articleModel: articleModel),
            Text("Published At: ${articleModel.publishedAt}"),
            Text(
              articleModel.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenSize.height / 45,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              articleModel.content,
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenSize.height / 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
