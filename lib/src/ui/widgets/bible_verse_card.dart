import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:flutter/material.dart';

class BibleVerseCard extends StatelessWidget {
  final BibleVerseModel verse;

  const BibleVerseCard(this.verse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(
            '${verse.book.name} - ${verse.book.author} (${verse.chapter}:${verse.number})'),
        subtitle: Text(verse.text),
        isThreeLine: true,
      ),
    );
  }
}
