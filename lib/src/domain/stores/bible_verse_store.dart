import 'package:daily_messages/src/domain/exceptions/exceptions.dart';
import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:daily_messages/src/domain/repositories/bible_verse_repository.dart';
import 'package:flutter/material.dart';

class BibleVerseStore {
  final IBibleVerseRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<BibleVerseModel>> state =
      ValueNotifier<List<BibleVerseModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>("");

  BibleVerseStore({required this.repository});

  Future<void> getMultipleVerses(int count, BuildContext context) async {
    isLoading.value = true;
    final Set<BibleVerseModel> uniqueVerses = {};
    try {
      for (int i = 0; i < count; i++) {
        final result = await repository.getVerses(context);
        uniqueVerses.addAll(result);
      }
      state.value = uniqueVerses.toList();
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
