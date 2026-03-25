import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsServices {
  Future<List<ArticleModel>> getArticles({required String category}) async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4f9214aa07e54a889b76fade6e40ccbe&category=$category",
    );
    List<dynamic> articles = response.data["articles"];
    List<ArticleModel> articlesModels = articles
        .map((article) => ArticleModel.fromJson(article))
        .toList();
    return articlesModels;
  }
}
