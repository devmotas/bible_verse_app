import 'dart:math';

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
  final ValueNotifier<List<BibleVerseModel>> bibleVerseModels =
      ValueNotifier<List<BibleVerseModel>>([]);
  final ValueNotifier<BibleVerseModel?> currentVerse =
      ValueNotifier<BibleVerseModel?>(null);

  final VerseService _verseService = VerseService();

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    final newVerses = await _verseService.getVersesData(context);
    bibleVerseModels.value = [
      ...bibleVerseModels.value,
      ...newVerses.where(
        (verse) => !bibleVerseModels.value.any(
          (existingVerse) =>
              verse.chapter != null &&
              existingVerse.chapter == verse.chapter &&
              existingVerse.number == verse.number,
        ),
      ),
    ];

    if (bibleVerseModels.value.isNotEmpty) {
      _updateCurrentVerse();
    }
  }

  void _updateCurrentVerse() {
    if (bibleVerseModels.value.isEmpty) return;

    BibleVerseModel? newCurrentVerse;
    do {
      newCurrentVerse = bibleVerseModels
          .value[Random().nextInt(bibleVerseModels.value.length)];
    } while (newCurrentVerse == currentVerse.value &&
        bibleVerseModels.value.length > 1);

    currentVerse.value = newCurrentVerse;
  }

  Future<void> _fetchMoreData() async {
    final newVerses = await _verseService.getMoreVersesData(context);
    bibleVerseModels.value = [
      ...bibleVerseModels.value,
      ...newVerses.where(
        (verse) => !bibleVerseModels.value.any(
          (existingVerse) =>
              existingVerse.chapter == verse.chapter &&
              existingVerse.number == verse.number,
        ),
      ),
    ];
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
          home: HomePage(
            bibleVerseModels: bibleVerseModels,
            currentVerse: currentVerse,
            fetchMoreData: _fetchMoreData,
            updateVerse: _updateCurrentVerse,
          ),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final ValueNotifier<List<BibleVerseModel>> bibleVerseModels;
  final ValueNotifier<BibleVerseModel?> currentVerse;
  final Future<void> Function() fetchMoreData;
  final VoidCallback updateVerse;

  const HomePage({
    super.key,
    required this.bibleVerseModels,
    required this.currentVerse,
    required this.fetchMoreData,
    required this.updateVerse,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ValueListenableBuilder<BibleVerseModel?>(
        valueListenable: widget.currentVerse,
        builder: (context, currentVerse, _) {
          return HomeScreen(
            verse: currentVerse,
            onUpdateVerse: widget.updateVerse,
          );
        },
      ),
      VersesScreen(
        bibleVerseModels: widget.bibleVerseModels,
        fetchMoreData: widget.fetchMoreData,
      ),
    ];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEEE9DA),
              Color(0xFFD8C9A2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: screens[currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD8C9A2),
              Color(0xFFEEE9DA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() => currentIndex = value),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.brown[800],
          unselectedItemColor: Colors.brown[400],
          selectedFontSize: 14,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
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
      ),
    );
  }
}
