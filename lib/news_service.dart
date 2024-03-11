import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_article.dart';

class NewsService {
  final String apiKey = 'f2bb23e29676418e891a8c66dee7345a';
  final String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<NewsArticle>> fetchNewsArticles() async {
    final response = await http.get(Uri.parse(baseUrl + apiKey));

    if (response.statusCode == 200) {
      List articles = json.decode(response.body)['articles'];

      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news articles');
    }
  }
}
