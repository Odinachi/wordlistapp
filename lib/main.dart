import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<WordPair> words = [];

  @override
  void initState() {
    super.initState();
    words = generateWordPairs().take(5).toList();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              words = words + generateWordPairs().take(5).toList();
            });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("WordList app"),
        ),
        body: ListView.separated(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return _itemCard(words[index].asUpperCase);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Widget _itemCard(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
