import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tic_tac_toe/screens/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        fontFamily: 'Spyder',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 245, 240, 240),
            fontSize: 40,
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 245, 240, 240),
            fontSize: 50,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 245, 240, 240),
          textStyle: const TextStyle(
            fontFamily: 'Spyder',
            fontSize: 40,
          ),
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 0, 19),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color.fromARGB(255, 240, 232, 232),
              ),
            ),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}
