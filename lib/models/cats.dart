import 'book.dart';

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
}
