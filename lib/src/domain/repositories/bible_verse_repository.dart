// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:new_bible_verse/src/domain/apis/api_url.dart';
import 'package:new_bible_verse/src/domain/exceptions/exceptions.dart';
import 'package:new_bible_verse/src/domain/http/http_client.dart';
import 'package:new_bible_verse/src/domain/keys/app_keys.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';
import 'package:flutter/material.dart';

abstract class IBibleVerseRepository {
  Future<List<BibleVerseModel>> getVerses(BuildContext context);
}

class BibleVerseRepository implements IBibleVerseRepository {
  late final IHttpClient client;

  BibleVerseRepository({required this.client});

  @override
  Future<List<BibleVerseModel>> getVerses(BuildContext context) async {
    Map<String, String> headers = {'bearer': AppKeys.BIBLE_API_KEY};

    final response = await client.get(
      url: ApiUrl.BIBLE_VERSES,
      headers: headers,
    );

    if (response.statusCode.toString().startsWith('20')) {
      final List<dynamic> body = jsonDecode(response.body);
      return BibleVerseModel.listFromJson(body);
    } else if (response.statusCode.toString().startsWith('40')) {
      throw NotFoundException('Recurso não encontrado');
    } else {
      throw Exception('Não foi possível carregar');
    }
  }
}
