import 'dart:math';
import 'package:flutter/material.dart';
import 'package:new_bible_verse/src/domain/models/bible_verse_model.dart';
import 'package:new_bible_verse/src/domain/services/verse_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VerseService _verseService = VerseService();
  BibleVerseModel? _verseOfTheDay;

  @override
  void initState() {
    super.initState();
    _fetchVerseOfTheDay();
  }

  /// Busca a lista de versículos e seleciona apenas um (aleatório)
  Future<void> _fetchVerseOfTheDay() async {
    try {
      final verses = await _verseService.getVersesData(context);
      if (verses.isNotEmpty) {
        final randomIndex = Random().nextInt(verses.length);
        setState(() {
          _verseOfTheDay = verses[randomIndex];
        });
      }
    } catch (e) {
      debugPrint('Erro ao buscar versículo do dia: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final verse = _verseOfTheDay;

    return Scaffold(
      /// Escolha de cores suaves
      /// Aqui, um fundo em degradê para dar um clima de tranquilidade
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

        /// Se ainda não carregou nada, mostramos o loading
        child: verse == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Título
                      Text(
                        'Versículo do Dia',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      const SizedBox(height: 32),

                      /// Mostrando o livro + capítulo + versículo
                      Text(
                        _buildReference(verse),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      /// Versículo
                      Text(
                        verse.text ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF4A4A4A),
                          height: 1.4, // para ficar mais espaçado
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      /// Botão de "Recarregar" para pegar outro versículo, se desejar
                      ElevatedButton(
                        onPressed: _fetchVerseOfTheDay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        child: const Text(
                          'Outro versículo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  /// Concatena, por exemplo, "Gênesis 1:1" ou "Mateus 5:9"
  String _buildReference(BibleVerseModel verse) {
    final book =
        '${verse.book.name} ${verse.book.author == 'Desconhecido' ? '' : verse.book.author}';
    final chapter = verse.chapter.toString().padLeft(2, '0');
    final number = verse.number.toString().padLeft(2, '0');
    return '$book $chapter:$number';
  }
}
