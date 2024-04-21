import 'dart:convert';

import 'book.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Category {
  final String name;
  final String about;
  final List<Book> books;

  Category({
    required this.name,
    required this.about,
    required this.books,
  });

  // Convert Category object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'about': about,
      'books': books.map((book) => book.toJson()).toList(),
    };
  }

  // Create a Category object from a JSON map
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      about: json['about'],
      books: (json['books'] as List<dynamic>)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList(),
    );
  }
  // Fetch and parse JSON data from a URL
  static Future<List<Category>> fetchCategoryFromUrl(String jsonUrl) async {
    final response = await http.get(Uri.parse(jsonUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from the URL');
    }
  }
}
