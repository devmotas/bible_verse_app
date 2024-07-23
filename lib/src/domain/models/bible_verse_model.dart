// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BibleVerseModel {
  final BookModel book;
  final int chapter;
  final int number;
  final String text;

  BibleVerseModel({
    required this.book,
    required this.chapter,
    required this.number,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'book': book.toMap(),
      'chapter': chapter,
      'number': number,
      'text': text,
    };
  }

  factory BibleVerseModel.fromMap(Map<String, dynamic> map) {
    try {
      return BibleVerseModel(
        book: BookModel.fromMap(map['book'] as Map<String, dynamic>),
        chapter: map['chapter'] as int,
        number: map['number'] as int,
        text: map['text'] as String,
      );
    } catch (e) {
      print('Erro ao converter BibleVerseModel: $e');
      rethrow;
    }
  }

  String toJson() => json.encode(toMap());

  factory BibleVerseModel.fromJson(String source) =>
      BibleVerseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BookModel {
  final String name;
  final String author;
  final String group;
  final String version;
  final Map<String, String> abbrev;

  BookModel({
    required this.name,
    required this.author,
    required this.group,
    required this.version,
    required this.abbrev,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'author': author,
      'group': group,
      'version': version,
      'abbrev': abbrev,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      name: map['name'] as String,
      author: map['author'] as String,
      group: map['group'] as String,
      version: map['version'] as String,
      abbrev: Map<String, String>.from(map['abbrev'] as Map),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
