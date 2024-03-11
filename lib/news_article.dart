class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String articleUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.articleUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String? ?? 'No Title',
      description: json['description'] as String? ?? 'No Description',
      urlToImage: json['urlToImage'] as String? ?? '',
      articleUrl: json['url'] as String? ?? '',
    );
  }
}
