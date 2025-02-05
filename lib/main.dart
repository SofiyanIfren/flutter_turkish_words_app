import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'data.dart';
import 'word.dart';

void main() {
  runApp(WordCardsApp());
}

class WordCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordCardsScreen(),
    );
  }
}

class WordCardsScreen extends StatefulWidget {
  @override
  _WordCardsScreenState createState() => _WordCardsScreenState();
}

class _WordCardsScreenState extends State<WordCardsScreen> {
  List<Word> words = [];
  List<Word> filteredWords = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadWords().then((loadedWords) {
      setState(() {
        words = loadedWords;
        filteredWords = words;
      });
    });
  }

  void filterWords(String query) {
    setState(() {
      filteredWords = words.where((word) {
        final turkishLower = word.turkish.toLowerCase();
        final englishLower = word.englishMeaning.toLowerCase();
        final frenchLower = word.frenchMeaning.toLowerCase();
        final searchLower = query.toLowerCase();
        return turkishLower.contains(searchLower) ||
            englishLower.contains(searchLower) ||
            frenchLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Cards'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterWords,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: filteredWords.length,
              itemBuilder: (context, index) {
                final word = filteredWords[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          word.turkish,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          word.frenchMeaning,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          word.englishMeaning,
                          style: TextStyle(fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}
