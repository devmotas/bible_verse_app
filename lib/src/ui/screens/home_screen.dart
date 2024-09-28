import 'dart:math';

import 'package:daily_messages/src/data/services/channels.dart';
import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:daily_messages/src/domain/services/verse_service.dart';
import 'package:daily_messages/src/ui/widgets/bible_verse_card.dart';
import 'package:daily_messages/src/ui/widgets/custom_snack_bar.dart';
import 'package:daily_messages/src/ui/widgets/modal_verse_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BibleVerseModel> _bibleVerseModels = [];
  final ScrollController _scrollController = ScrollController();
  final VerseService _verseService = VerseService();

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
    initPlatformState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels + 200 >=
              _scrollController.position.maxScrollExtent &&
          _bibleVerseModels.length < 100) {
        await _fetchMoreData();
      }
    });
  }

  void initPlatformState() {
    Channels.versechannel.setMethodCallHandler((call) async {
      print('chamou ' + call.method);
      if (call.method == 'refreshData') {
        _fetchInitialData();
      }
    });
  }

  void sendDataToKotlin(BibleVerseModel data) async {
    try {
      var res = await Channels.versechannel
          .invokeMethod('sendNewVerse', data.toJson());
      CustomSnackBar.show(
        context,
        'Versículo atualizado com sucesso',
        success: true,
      );
    } on PlatformException catch (e) {
      print("Failed to send data to Kotlin: '${e.message}'.");
    }
  }

  Future<void> _fetchInitialData() async {
    final bibleVerseModels = await _verseService.getVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(bibleVerseModels.where((verse) =>
          !_bibleVerseModels.any((existingVerse) =>
              existingVerse.chapter == verse.chapter &&
              existingVerse.number == verse.number)));

      if (bibleVerseModels.isNotEmpty) {
        final randomIndex = Random().nextInt(bibleVerseModels.length);
        sendDataToKotlin(bibleVerseModels[randomIndex]);
      }
    });
  }

  Future<void> _fetchMoreData() async {
    final bibleVerseModels = await _verseService.getMoreVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(bibleVerseModels.where((verse) =>
          !_bibleVerseModels.any((existingVerse) =>
              existingVerse.chapter == verse.chapter &&
              existingVerse.number == verse.number)));
    });
  }

  Future<void> openModalVerseDetails(
      BuildContext context, BibleVerseModel bibleVerseModel) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      builder: (BuildContext context) {
        return ModalVerseDetails(bibleVerseModel: bibleVerseModel);
      },
    );

    if (result == true) {
      sendDataToKotlin(bibleVerseModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: myTheme.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: myTheme.colorScheme.tertiary,
        title: const Text('Versículos'),
        centerTitle: true,
      ),
      body: _bibleVerseModels.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: _bibleVerseModels.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _bibleVerseModels.length) {
                      return _bibleVerseModels.length < 100
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink();
                    }
                    return InkWell(
                      onTap: () {
                        openModalVerseDetails(
                            context, _bibleVerseModels[index]);
                      },
                      child: BibleVerseCard(_bibleVerseModels[index]),
                    );
                  },
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
