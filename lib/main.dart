// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {   // StatelessWidget: os widgets nao mudam suas caracteristicas.
  @override                             // Sobrescreve um método (build()), por ser uma classe abstrata e nós devemos determinar seu comportamento
  Widget build(BuildContext context) {  //  BuildContext: Localiza cada widget
    return MaterialApp(                 //  ver Material design
      title: 'Startup name generator',
      home: RandomWords(),
    );
  }
}

// StatefulWidget (stful)

class RandomWords extends StatefulWidget {
  @override 
  _RandomWordsState createState() => _RandomWordsState(); // underline == private
}

class _RandomWordsState extends State<RandomWords> {      // por padrão, States são prefixados com _
  final _suggestions = <WordPair>[];  // array  
  final _biggerFont = const TextStyle(fontSize: 20.0);

  Widget _buildSuggestions() {
    return ListView.builder(                    // ListView: lista rolável de widgets organizados linearmente
      padding: const EdgeInsets.all(16.0),      // Padding: adiciona margens | EdgeInsets: determina o deslocamento em todas (.all) as direções
      itemBuilder: (context, i) {               // itemBuilder: adiciona cada wordPair na lista
        if (i.isOdd) return const Divider();    // se i == ímpar, cria um divisor

        final index = i ~/ 2;                   // i/2 = inteiro. Calcula a quantidade de palavras na lista sem os divisores
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); // no fim da lista, add +10
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(        // ListTile: estiliza a lista de acordo com Material Design
      title: Text(
        pair.asPascalCase,  // asPascalCase == UpperCamelCase
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup name generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}