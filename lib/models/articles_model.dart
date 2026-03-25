import 'package:intl/intl.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    String formatPublishedAt(String dateString) {
      DateTime date = DateTime.parse(dateString);
      return DateFormat('EEEE-dd-MM').format(date);
    }
    return ArticleModel(
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description available',
      urlToImage: json['urlToImage'] ?? 'https://i.sstatic.net/y9DpT.jpg',
      publishedAt: json['publishedAt'] != null
          ? formatPublishedAt(json['publishedAt'])
          : 'No date',
      content: json['content'] ?? '',
    );
  }
}
