import 'package:flutter/material.dart';
import 'news_service.dart';
import 'news_article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'News App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: NewsListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final NewsService _newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Latest News'),

      ),
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsService.fetchNewsArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length??0,
              itemBuilder: (context, index) {
                NewsArticle article = snapshot.data![index];
                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: article.urlToImage != null
                      ? Image.network(
                    article.urlToImage,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                      : SizedBox(width: 100, child: Center(child: Icon(Icons.image_not_supported))),
                  title: Text(article.title ?? 'No title available'),
                  subtitle: Text(
                    article.description ?? 'No description available',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    // Implement your logic to open article details or a webview
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
