import 'package:flutter/material.dart';
import 'package:jeff_talks/views/home_page/my_home_page.dart';
import 'common/common.dart';

const String version = '.09';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}


