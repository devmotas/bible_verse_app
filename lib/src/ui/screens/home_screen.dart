import 'dart:math';
import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<List<BibleVerseModel>> bibleVerseModels;

  const HomeScreen({required this.bibleVerseModels, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BibleVerseModel? verse;

  @override
  void initState() {
    super.initState();
    _loadInitialVerse();
  }

  void _loadInitialVerse() {
    if (widget.bibleVerseModels.value.isNotEmpty) {
      setState(() {
        verse = widget.bibleVerseModels
            .value[Random().nextInt(widget.bibleVerseModels.value.length)];
      });
    }
  }

  void _getNewVerse() {
    final oldVerse = verse;
    BibleVerseModel? newVerse;

    if (widget.bibleVerseModels.value.isNotEmpty) {
      do {
        newVerse = widget.bibleVerseModels
            .value[Random().nextInt(widget.bibleVerseModels.value.length)];
      } while (newVerse == oldVerse);
    }

    if (newVerse != null) {
      setState(() {
        verse = newVerse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: verse == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Versículo do Dia',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        _buildReference(verse!),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        verse!.text ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF4A4A4A),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _getNewVerse,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        child: const Text(
                          'Outro versículo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  String _buildReference(BibleVerseModel verse) {
    final book =
        '${verse.book.name} ${verse.book.author == 'Desconhecido' ? '' : verse.book.author}';
    final chapter = verse.chapter.toString().padLeft(2, '0');
    final number = verse.number.toString().padLeft(2, '0');
    return '$book $chapter:$number';
  }
}
