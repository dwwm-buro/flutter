import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(120, 120, 120, 1)
        )
      ),
      home: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Mon Application'),
        ),
        body: const Center(
          child: Text(
            'Fiorella',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 48),
          ),
        )
      )
    );
  }
}
