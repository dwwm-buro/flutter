// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget button(String label, [Color color = Colors.blue, IconData? icon]) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          if (icon != null) Icon(icon, color: color, size: 30),
          Text(
            label,
            style: TextStyle(fontSize: 18, color: color)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Mon Application'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Bianca', style: TextStyle(fontSize: 20)),
                Text('Mina', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('Call 1'),
              button('Call 2', Colors.red, Icons.home),
              button('Call 3', Colors.green, Icons.favorite)
            ],
          )
        ],
      )
    );
  }
}
