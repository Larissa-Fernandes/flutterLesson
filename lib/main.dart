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
      title: 'Welcome to Flutter',
      home: Scaffold(                   //  Scaffold: permite montar a estrutura básica de uma tela
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(), 
        ),
      ),
    );
  }
}

//StatefulWidget (stful)

class RandomWords extends StatefulWidget {
  @override 
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {  // por padrão, States são prefixados com _
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);   // asPascalCase == UpperCamelCase
  }
}