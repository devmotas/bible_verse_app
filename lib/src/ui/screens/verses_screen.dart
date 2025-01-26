import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';
import 'package:new_bible_verse/src/ui/widgets/modal_verse_details.dart';
import 'package:new_bible_verse/src/ui/widgets/bible_verse_card.dart';

class VersesScreen extends StatefulWidget {
  final ValueNotifier<List<BibleVerseModel>> bibleVerseModels;
  final Future<void> Function() fetchMoreData;

  const VersesScreen({
    required this.bibleVerseModels,
    required this.fetchMoreData,
    super.key,
  });

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels + 200 >=
              _scrollController.position.maxScrollExtent &&
          widget.bibleVerseModels.value.length < 100 &&
          !isLoading) {
        setState(() {
          isLoading = true;
        });
        await widget.fetchMoreData();
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BibleVerseModel>>(
      valueListenable: widget.bibleVerseModels,
      builder: (context, bibleVerseModels, _) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFEEE9DA),
                  Color(0xFFD8C9A2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: bibleVerseModels.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: bibleVerseModels.length + (isLoading ? 1 : 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == bibleVerseModels.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: CircularProgressIndicator(
                              color: Colors.brown,
                            ),
                          ),
                        );
                      }
                      final verseItem = bibleVerseModels[index];
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
          ),
        );
      },
    );
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
      // Ação após fechar o modal, se necessário
    }
  }
}
