import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/response_articles.dart';

class Client {
  static Future<List<Article>> fetchArticle() async {
    const url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=589246d0937e46acbc06fa341406dba8";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // ignore: always_specify_types

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ResponseArticles responseArticles =
          ResponseArticles.fromJson(responseBody);
      return responseArticles.articles;
    } else {
      throw Exception("Failed to load article");
    }
  }
}
