import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';
import 'package:new_bible_verse/src/domain/services/verse_service.dart';
import 'package:new_bible_verse/src/ui/widgets/custom_snack_bar.dart';
import 'package:new_bible_verse/src/ui/widgets/modal_verse_details.dart';
// Importamos o card customizado abaixo
import 'package:new_bible_verse/src/ui/widgets/bible_verse_card.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({super.key});

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  final List<BibleVerseModel> _bibleVerseModels = [];
  final ScrollController _scrollController = ScrollController();
  final VerseService _verseService = VerseService();

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
    // initPlatformState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels + 200 >=
              _scrollController.position.maxScrollExtent &&
          _bibleVerseModels.length < 100) {
        await _fetchMoreData();
      }
    });
  }

  Future<void> _fetchInitialData() async {
    final bibleVerseModels = await _verseService.getVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(
        bibleVerseModels.where(
          (verse) => !_bibleVerseModels.any(
            (existingVerse) =>
                verse.chapter != null &&
                existingVerse.chapter == verse.chapter &&
                existingVerse.number == verse.number,
          ),
        ),
      );

      // if (bibleVerseModels.isNotEmpty) {
      //   final randomIndex = Random().nextInt(bibleVerseModels.length);
      //   sendDataToKotlin(bibleVerseModels[randomIndex]);
      // }
    });
  }

  Future<void> _fetchMoreData() async {
    final bibleVerseModels = await _verseService.getMoreVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(
        bibleVerseModels.where(
          (verse) => !_bibleVerseModels.any(
            (existingVerse) =>
                existingVerse.chapter == verse.chapter &&
                existingVerse.number == verse.number,
          ),
        ),
      );
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
      // sendDataToKotlin(bibleVerseModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Aplicamos um AppBar com cor em harmonia com o degradê
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: const Text(
          'Versículos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      // Em vez de backgroundColor fixo, criamos um Container com gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEEE9DA), // tom de bege claro
              Color(0xFFD8C9A2), // bege um pouco mais escuro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _bibleVerseModels.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              )
            : Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: _bibleVerseModels.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      // Exibe loading ao chegar no final, se ainda há mais a carregar
                      if (index == _bibleVerseModels.length) {
                        return _bibleVerseModels.length < 100
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: CircularProgressIndicator(
                                    color: Colors.brown,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      }

                      // Cada item da lista (versículo)
                      final verseItem = _bibleVerseModels[index];
                      return InkWell(
                        onTap: () {
                          openModalVerseDetails(context, verseItem);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: BibleVerseCard(verseItem),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
