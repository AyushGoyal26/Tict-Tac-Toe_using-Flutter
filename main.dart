import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/home.dart';
import 'package:tictac/screenchanger.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData.light(),
      home: HomeScr(),
    ),
  ));
}

