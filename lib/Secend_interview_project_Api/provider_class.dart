import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_api_service.dart';
import 'new_model.dart';


class NewsProvider with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedCategory = "business";
  bool _loading = false;
  List<Article> _articles = [];
  List<String> _favouriteTitles = [];

  final List<String> _categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  TextEditingController get searchController => _searchController;
  String? get selectedCategory => _selectedCategory;
  bool get loading => _loading;
  List<Article> get articles => _articles;
  List<String> get favouriteTitles => _favouriteTitles;
  List<String> get categories => _categories;

  set selectedCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();
    fetchNews(value);
  }

  NewsProvider() {
    _loadFavourites();
    fetchNews(_selectedCategory);
  }

  Future<void> _loadFavourites() async {
    var prefs = await SharedPreferences.getInstance();
    _favouriteTitles = prefs.getStringList('favouriteTitles') ?? [];
    notifyListeners();
  }

  Future<void> fetchNews(String? category, [String? query]) async {
    if (category != null) {
      _loading = true;
      notifyListeners();

      var newsService = NewsApiService();
      var newsSearchModel = await newsService.getNews(category, query);

      _articles = newsSearchModel.articles ?? [];
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addFavourite(Article article) async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? favourites = prefs.getStringList('favourites') ?? [];
    favourites.add('${article.title}|${article.description??"No description"}|${article.urlToImage}');
    await prefs.setStringList('favourites', favourites);

    if (!_favouriteTitles.contains(article.title)) {
      _favouriteTitles.add(article.title!);
      await prefs.setStringList('favouriteTitles', _favouriteTitles);
    }

    notifyListeners();
  }

  Future<void> removeFavourite(Article article) async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? favourites = prefs.getStringList('favourites');
    if (favourites != null) {
      favourites.removeWhere((item) => item.startsWith('${article.title}|'));
      await prefs.setStringList('favourites', favourites);
    }

    if (_favouriteTitles.contains(article.title)) {
      _favouriteTitles.remove(article.title!);
      await prefs.setStringList('favouriteTitles', _favouriteTitles);
    }

    notifyListeners();
  }

  Future<List<Map<String, String>>> getFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favourites = prefs.getStringList('favourites');
    if (favourites == null) {
      return [];
    }
    return favourites.map((item) {
      var parts = item.split('|');
      return {
        'title': parts.isNotEmpty ? parts[0] : '',
        'description': parts.length > 1 ? parts[1] : '',
        'image': parts.length > 2 ? parts[2] : '',
      };
    }).toList();
  }

  Future<void> removeFavouriteByIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favourites = prefs.getStringList('favourites');
    if (favourites != null && index >= 0 && index < favourites.length) {
      favourites.removeAt(index);
      await prefs.setStringList('favourites', favourites);

      _favouriteTitles = favourites.map((item) {
        var parts = item.split('|');
        return parts.isNotEmpty ? parts[0] : '';
      }).toList();
      await prefs.setStringList('favouriteTitles', _favouriteTitles);

      notifyListeners();
    }
  }
}
