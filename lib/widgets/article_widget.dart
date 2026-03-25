import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/screen_size.dart';
import 'package:news_app/widgets/article_author.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    ScreenSize.initial(context);
    return Container(
      height: ScreenSize.height / 7,
      margin: EdgeInsets.only(bottom: ScreenSize.height / 90),
      child: Row(
        children: [
          Image.network(
            articleModel.urlToImage,
            width: ScreenSize.width / 2.5,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(width: ScreenSize.width / 45),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ArticleAuthor(articleModel: articleModel),
                SizedBox(height: ScreenSize.height / 200),
                Text(
                  articleModel.description,
                  style: TextStyle(fontSize: ScreenSize.height / 80),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    articleModel.publishedAt,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenSize.height / 70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
