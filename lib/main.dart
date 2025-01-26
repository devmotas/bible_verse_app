import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';
import 'package:new_bible_verse/src/domain/services/verse_service.dart';
// Importe suas funções de tema
import 'package:new_bible_verse/src/shared/themes/theme_util.dart';
import 'package:new_bible_verse/src/shared/themes/theme.dart';
import 'package:new_bible_verse/src/ui/screens/home_screen.dart';
import 'package:new_bible_verse/src/ui/screens/verses_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<BibleVerseModel> _bibleVerseModels = [];

  final ScrollController _scrollController = ScrollController();

  final VerseService _verseService = VerseService();

  void initState() {
    super.initState();
    _fetchInitialData();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels + 200 >=
              _scrollController.position.maxScrollExtent &&
          _bibleVerseModels.length < 100) {
        // await _fetchMoreData();
      }
    });
  }

  Future<void> _fetchInitialData() async {
    final bibleVerseModels = await _verseService.getVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(
        bibleVerseModels.where(
          (verse) => !_bibleVerseModels.any(
            (existingVerse) =>
                verse.chapter != null &&
                existingVerse.chapter == verse.chapter &&
                existingVerse.number == verse.number,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        TextTheme textTheme = createTextTheme(context, "Lora", "Merriweather");
        MaterialTheme theme = MaterialTheme(textTheme);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.light(),
          darkTheme: theme.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // Suas telas
  final List<Widget> screens = [
    const HomeScreen(),
    const VersesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Versos',
          ),
        ],
      ),
    );
  }
}
