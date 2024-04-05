import 'dart:ui';

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:jeff_talks/models/books.dart';
import 'common/common.dart';
import 'common/load_url.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/*Future<String> getImageUrl(String imagePath) async {
  final storageRef = FirebaseStorage.instance.ref().child(imagePath);
  final url = await storageRef.getDownloadURL();
  return url;
}*/

const String version = '.00';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jeff Talks',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Jeff Talks'),
    );
  }
}

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
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/horror_books.json?alt=media&token=99b3cecc-08ab-4e84-88a3-30d3d27f6f73'),
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

               /* inLineComment('Post Apocalyptic Western \n with TJ Reeder'),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/horror_books.json?alt=media&token=f96244fc-6a30-4659-8afe-376a41d4d7be'),
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
                ),*/
                inLineComment("Drama Books"),
                FutureBuilder<List<Book>>(
                  future: Book.fetchBooksFromUrl(
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/drama_books.json?alt=media&token=792d53e7-5a31-46dc-91f0-4b72e4749ded'),
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
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/info_books.json?alt=media&token=52c7ad96-82c9-4594-92ab-df3531a12ad2'),
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
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/poetry_books.json?alt=media&token=59e1d37a-51d1-42d6-89fa-4585091100c6'),
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
                      'https://firebasestorage.googleapis.com/v0/b/jeff-talks.appspot.com/o/children_books.json?alt=media&token=f061e677-929a-464e-9907-b5d6f4f7d3c9'),
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

class AnimationCard extends StatefulWidget {
  const AnimationCard(
      {super.key,
      required this.child,
      required this.text,
      required this.dimens,
      required this.url});

  final String url;
  final BoxConstraints dimens;
  final Widget child;
  final String text;

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController scaleAnimationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    scaleAnimation = Tween(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => scaleAnimationController.forward(),
      onPointerUp: (_) => scaleAnimationController.reverse(),
      onPointerCancel: (_) => scaleAnimationController.reverse(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => scaleAnimationController.forward(),
        onExit: (_) => scaleAnimationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          alignment: Alignment.center,
          filterQuality: FilterQuality.high,
          child: GestureDetector(
            onTap: () => _showDialog(context),
            // Tilt here
            child: Tilt(
              borderRadius: BorderRadius.circular(20),
              tiltConfig: const TiltConfig(filterQuality: FilterQuality.high),
              lightConfig: const LightConfig(
                minIntensity: 0.1,
                maxIntensity: 0.4,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Align(
            child: Transform.scale(
              scale: 1.2,
              filterQuality: FilterQuality.high,
              // Tilt here
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Tilt(
                    borderRadius: BorderRadius.circular(20),
                    tiltConfig: const TiltConfig(
                      enableRevert: false,
                      enableSensorRevert: false,
                      filterQuality: FilterQuality.high,
                    ),
                    lightConfig: const LightConfig(
                      minIntensity: 0.1,
                      maxIntensity: 0.4,
                    ),
                    shadowConfig: const ShadowConfig(disable: true),
                    child: widget.child,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        onLongPress: () {},
                        onPressed: () {
                          LaunchFile.launchUrl(widget.url);
                        },
                        icon: const Icon(Icons.book_online_sharp),
                        label: const Text('See This Book on Amazon')),
                  ),
                  SizedBox(
                      width: widget.dimens.maxWidth / 2,
                      height: widget.dimens.maxHeight / 3,
                      child: SingleChildScrollView(
                          child: Text(
                        widget.text,
                        style: const TextStyle(color: Colors.white54),
                      )))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
