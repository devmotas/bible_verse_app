import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';

class ModalVerseDetails extends StatelessWidget {
  final BibleVerseModel bibleVerseModel;

  const ModalVerseDetails({super.key, required this.bibleVerseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF4A4A4A),
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          Text(
            '${bibleVerseModel.book.author == 'Desconhecido' ? bibleVerseModel.book.name : bibleVerseModel.book.author} - ${bibleVerseModel.chapter}:${bibleVerseModel.number}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                bibleVerseModel.text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4A4A4A),
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.brown[800],
                backgroundColor: Colors.brown[300],
                side: BorderSide(color: Colors.brown[800]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 24,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                'Definir como versículo do dia',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
