import 'package:daily_messages/src/domain/http/http_client.dart';
import 'package:daily_messages/src/domain/models/bible_verse_model.dart';
import 'package:daily_messages/src/domain/repositories/bible_verse_repository.dart';
import 'package:daily_messages/src/domain/stores/bible_verse_store.dart';
import 'package:daily_messages/src/ui/widgets/bible_verse_card.dart';
import 'package:daily_messages/src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BibleVerseStore _store = BibleVerseStore(
    repository: BibleVerseRepository(
      client: HttpClientAdapter(),
    ),
  );
  final List<BibleVerseModel> _bibleVerseModels = [];
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    _loadInitialVerses();
    _scrollController.addListener(() {
      if (_store.state.value.length < 50) {
        _loadMoreVerses();
      } else if (_scrollController.position.pixels + 200 >=
              _scrollController.position.maxScrollExtent &&
          _store.state.value.length < 100) {
        _loadMoreVerses();
      }
    });
  }

  void _loadInitialVerses() async {
    try {
      await _store.getMultipleVerses(10, context);
      setState(() {
        _bibleVerseModels.addAll(_store.state.value);
      });
    } catch (e) {
      CustomSnackBar.show(
        context,
        'Erro inesperado durante a obtenção dos versículos.',
        success: false,
      );
    }
  }

  void _loadMoreVerses() async {
    if (_isFetchingMore) return;
    _isFetchingMore = true;
    try {
      await _store.getMultipleVerses(10, context);
      setState(() {
        _bibleVerseModels.addAll(_store.state.value);
      });
    } catch (e) {
      CustomSnackBar.show(
        context,
        'Erro inesperado durante a obtenção dos versículos.',
        success: false,
      );
    } finally {
      _isFetchingMore = false;
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
          : ListView.builder(
              controller: _scrollController,
              itemCount: _bibleVerseModels.length,
              itemBuilder: (BuildContext context, int index) {
                return BibleVerseCard(_bibleVerseModels[index]);
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
