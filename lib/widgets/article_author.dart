import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/screen_size.dart';


class ArticleAuthor extends StatelessWidget {
  const ArticleAuthor({super.key, required this.articleModel});
    final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
     ScreenSize.initial(context);
    return Row(
                  children: [
                    CircleAvatar(
                      radius: ScreenSize.height / 50,
                      backgroundImage: NetworkImage(articleModel.urlToImage),
                    ),
                    SizedBox(width: ScreenSize.width / 45),
                    Expanded(
                      child: Text(
                        articleModel.author,
                        style: TextStyle(
                          fontSize: ScreenSize.height / 80,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
  }
}