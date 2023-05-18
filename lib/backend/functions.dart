import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news_application/utils/key.dart';
import 'package:tech_news_application/widgets/searchbar.dart';

Future<List> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${ApiKey.key}${SearchBarWidget.searchController.text}'));

  Map result = jsonDecode(response.body);
  print('fetched');
  return (result['articles']);
}
