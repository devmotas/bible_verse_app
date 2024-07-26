import 'dart:convert';

import 'package:daily_messages/src/domain/http/http_client.dart';
import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:daily_messages/src/domain/repositories/bible_verse_repository.dart';
import 'package:daily_messages/src/domain/services/check_internet_connection_service.dart';
import 'package:daily_messages/src/domain/services/shared_preferences_service.dart';
import 'package:daily_messages/src/domain/stores/bible_verse_store.dart';
import 'package:daily_messages/src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VerseService {
  final BibleVerseStore _store = BibleVerseStore(
    repository: BibleVerseRepository(
      client: HttpClientAdapter(),
    ),
  );
  final List<BibleVerseModel> _bibleVerseModels = [];
  bool _isFetchingMore = false;
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();
  final CheckInternetConnectionService _checkInternetConnectionService =
      CheckInternetConnectionService();
  final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<List<BibleVerseModel>> getVersesData(BuildContext context) async {
    try {
      final isConnected =
          await _checkInternetConnectionService.checkInternetConnection();

      final lastDataSaved =
          await _sharedPreferencesService.getSharedData('lastDataSaved') ?? '';
      await Future.delayed(const Duration(milliseconds: 100));

      if (lastDataSaved != today && isConnected) {
        await _sharedPreferencesService.removeSharedData('bibleVerses');
        await _sharedPreferencesService.removeSharedData('lastDataSaved');
      }
      final recoveredData = await recoveryData();
      await Future.delayed(const Duration(milliseconds: 100));

      if (recoveredData.isNotEmpty) {
        return recoveredData;
      } else {
        if (!context.mounted) return [];
        return await fetchData(context);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<BibleVerseModel>> getMoreVersesData(BuildContext context) async {
    try {
      final isConnected =
          await _checkInternetConnectionService.checkInternetConnection();

      final lastDataSaved =
          await _sharedPreferencesService.getSharedData('lastDataSaved') ?? '';
      await Future.delayed(const Duration(milliseconds: 100));

      if (lastDataSaved != today && isConnected) {
        await _sharedPreferencesService.removeSharedData('bibleVerses');
        await _sharedPreferencesService.removeSharedData('lastDataSaved');
      }
      final recoveredData = await recoveryData();
      await Future.delayed(const Duration(milliseconds: 100));

      if (recoveredData.isNotEmpty && recoveredData.length >= 100) {
        await saveVerse(_bibleVerseModels);
        return recoveredData;
      } else {
        if (!context.mounted) return [];
        return await fetchData(context);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<BibleVerseModel>> fetchData(BuildContext context) async {
    try {
      if (_bibleVerseModels.isEmpty || !_isFetchingMore) {
        _isFetchingMore = true;
        await _store.getMultipleVerses(1, context);
        _bibleVerseModels.addAll(_store.state.value);
        _isFetchingMore = false;
      }
      await saveVerse(_bibleVerseModels);
      return _store.state.value;
    } catch (e) {
      _isFetchingMore = false;
      if (!context.mounted) return [];
      CustomSnackBar.show(
        context,
        'Erro inesperado durante a obtenção dos versículos.',
        success: false,
      );
      return [];
    }
  }

  Future<void> saveVerse(List<BibleVerseModel> bibleVerseModels) async {
    final jsonString = jsonEncode(BibleVerseModel.listToJson(bibleVerseModels));
    await _sharedPreferencesService.saveSharedData('lastDataSaved', today);
    await _sharedPreferencesService.saveSharedData('bibleVerses', jsonString);
    await Future.delayed(const Duration(milliseconds: 100));
  }

  Future<List<BibleVerseModel>> recoveryData() async {
    final jsonString =
        await _sharedPreferencesService.getSharedData('bibleVerses');
    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return BibleVerseModel.listFromJson(jsonList);
      } catch (e) {
        print('Erro ao decodificar JSON: $e');
        return [];
      }
    }
    return [];
  }
}
