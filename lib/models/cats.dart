import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Cats {
  final String name;
  final String category;
  final String url;
  final String about;
  final String image;

  Cats({
    required this.name,
    required this.category,
    required this.url,
    required this.about,
    required this.image,
  });

  // Convert MyData object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'url': url,
      'about': about,
      'image': image,
    };
  }

  // Create a MyData object from a JSON map
  factory Cats.fromJson(Map<String, dynamic> json) {
    return Cats(
      name: json['name'],
      category: json['category'],
      url: json['url'],
      about: json['about'],
      image: json['image'],
    );
  }
// Fetch and parse JSON data from a URL
  static Future<List<Cats>> fetchCatsFromUrl(String jsonUrl) async {
    final response = await http.get(Uri.parse(jsonUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Cats.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from the URL');
    }
  }

  // Read MyData records from a JSON file
  static Future<List<Cats>> readFromJsonFile(String filePath) async {
    final file = File(filePath);
    final contents = await file.readAsString();
    final List<dynamic> jsonList = json.decode(contents);
    return jsonList.map((json) => Cats.fromJson(json)).toList();
  }
}

