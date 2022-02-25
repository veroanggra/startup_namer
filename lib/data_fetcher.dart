import 'dart:math';
import 'package:english_words/english_words.dart';

class DataFetcher {
  final _numberData = 100;
  final _numberItemOnPage = 5;
  int _currentPageLoad = 0;

  Future<List<WordPair>> fecth() async {
    final listData = <WordPair>[];
    final h = min(
        _numberItemOnPage, _numberData - _currentPageLoad * _numberItemOnPage);
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < h; i++) {
        listData.add(WordPair.random());
      }
    });
    _currentPageLoad++;
    return listData;
  }
}
