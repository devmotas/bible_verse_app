import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:flutter/material.dart';

class ModalVerseDetails extends StatelessWidget {
  final BibleVerseModel bibleVerseModel;

  const ModalVerseDetails({super.key, required this.bibleVerseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: IconButton(
                alignment: Alignment.topLeft,
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Text(
            '${bibleVerseModel.book.author == 'Desconhecido' ? bibleVerseModel.book.name : bibleVerseModel.book.author} - ${bibleVerseModel.chapter}:${bibleVerseModel.number}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Text(
                bibleVerseModel.text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                )),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Definir como versículo do dia'),
          ),
        ],
      ),
    );
  }
}
