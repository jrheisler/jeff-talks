import 'package:flutter/material.dart';

import '../../common/animation_card.dart';
import '../../common/common.dart';
import '../../models/books.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, dimens) {
      return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.deepOrange,
              pinned: true,
              collapsedHeight: 60,
              expandedHeight: 400.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  'assets/JeffTalks.webp',
                  fit: BoxFit.fill,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: kShadow(20),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                inLineComment('A Study in Horror \n with Charles Welch'),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/horror_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),

                inLineComment('Post Apocalyptic Western \n with TJ Reeder'),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/tj_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                inLineComment("Drama Books"),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/drama_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),


                inLineComment("Informative Books"),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/info_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                inLineComment('Poetry'),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/poetry_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),

                inLineComment("Children's Books"),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/children_books.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final books = snapshot.data!;
                      return animationBookCards(dimens, books);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),



                inLineComment('Contact:\njrheisler@yahoo.com\nAsk about a free review copy'),
              ], addAutomaticKeepAlives: true),
            ),
          ],
        ),
        //backgroundColor: Colors.grey[200],
      );
    });
  }

  Widget animationBookCards(BoxConstraints dimens, myBooks) {
    List<Widget> ani = [];
    for (var book in myBooks) {
      ani.add(AnimationCard(
          url: book.url,
          dimens: dimens,
          text: book.about,
          child: Image.network(
            book.image,
            width: 200,
          )));
    }

    return Container(
      color: Colors.deepOrange,
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [...ani],
      ),
    );
  }
}
