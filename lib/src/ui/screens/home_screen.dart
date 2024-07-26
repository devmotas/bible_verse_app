import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:daily_messages/src/domain/services/verse_service.dart';
import 'package:daily_messages/src/ui/widgets/bible_verse_card.dart';
import 'package:daily_messages/src/ui/widgets/modal_verse_details.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
    _fetchInitialData();

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
      _bibleVerseModels.addAll(bibleVerseModels);
    });
  }

  Future<void> _fetchMoreData() async {
    final bibleVerseModels = await _verseService.getMoreVersesData(context);
    setState(() {
      _bibleVerseModels.addAll(bibleVerseModels);
    });
  }

  void openModalVerseDetails(
      BuildContext context, BibleVerseModel bibleVerseModel) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ModalVerseDetails(bibleVerseModel: bibleVerseModel);
        });
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
          : ListView.builder(
              controller: _scrollController,
              itemCount: _bibleVerseModels.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    openModalVerseDetails(context, _bibleVerseModels[index]);
                  },
                  child: BibleVerseCard(_bibleVerseModels[index]),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
