import 'package:flutter/material.dart';
import 'package:jeff_talks/models/cats.dart';

import '../../common/animation_card.dart';
import '../../common/common.dart';
import '../../common/my_email.dart';
import '../../models/book.dart';

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
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      MyEmail myEmail = MyEmail('jrheisler@yahoo.com', 'Jeff Talks Email', 'Please send me Review Codes for - ');
                      myEmail.send();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white)),
                    child: const Text('Email Jeff'),
                  ),
                ),

              ],
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
                FutureBuilder<List<Category>>(
                  future: Category.fetchCategoryFromUrl(
                      'https://raw.githubusercontent.com/jrheisler/jeff-talks/main/lib/models/cats.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final cats = snapshot.data!;
                      List<Widget> widgets = [];
                      for (var cat in cats) {
                        widgets.add(inLineComment(cat.about));
                        widgets.add(animationBookCards(dimens, cat.books));
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: widgets),
                      );
                    }
                  },
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