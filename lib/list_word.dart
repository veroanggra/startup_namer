import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/data_fetcher.dart';

class ListWord extends StatefulWidget {
  const ListWord({Key? key}) : super(key: key);

  @override
  _ListWordState createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  final _wordData = <WordPair>[];
  bool _isLoading = true;
  bool _isMoreData = true;
  final _dataFetcher = DataFetcher();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _isMoreData = true;
    _loadDataMore();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListWord();
  }

  Widget _buildListWord() {
    return ListView.builder(
        itemCount: _isMoreData ? _wordData.length + 1 : _wordData.length,
        itemBuilder: (context, i) {
          if (i >= _wordData.length) {
            if (!_isLoading) {
              _loadDataMore();
            }
            return const Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              height: 20,
              width: 20,
            ));
          }
          return ListTile(
            leading: Text(
              i.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            title: Text(
              _wordData[i].asPascalCase,
              style: const TextStyle(fontSize: 20),
            ),
          );
        });
  }

  void _loadDataMore() {
    _isLoading = true;
    _dataFetcher.fecth().then((List<WordPair> fetchedListData) {
      if (fetchedListData.isEmpty) {
        setState(() {
          _isLoading = false;
          _isMoreData = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _wordData.addAll(fetchedListData);
        });
      }
    });
  }
}
