import 'dart:convert';
import 'package:http/http.dart' as http;

import 'new_model.dart';




class NewsApiService {
  final String url = "https://newsapi.org/v2/top-headlines";
  final String apiKey = "0a22172a2efb46ba972be495bb246719";

  Future<NewsModel> getNews(String category, [String? query]) async {
    var fullUrl = Uri.parse("$url?country=us&category=$category&apiKey=$apiKey");
    if (query != null && query.isNotEmpty) {
      fullUrl = Uri.parse("$url?country=us&category=$category&q=$query&apiKey=$apiKey");
    }

    try {
      var response = await http.get(fullUrl);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return NewsModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
