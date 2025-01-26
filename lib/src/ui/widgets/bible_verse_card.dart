import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';

class BibleVerseCard extends StatelessWidget {
  final BibleVerseModel verse;

  const BibleVerseCard(this.verse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card com leve transparência para se integrar ao degradê
      color: Colors.white.withOpacity(0.85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exemplo de título/referência do versículo
            Text(
              _buildReference(verse),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Texto do versículo
            Text(
              verse.text ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ],
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
