// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:learn_flutter/views/home_page.dart';
import 'package:learn_flutter/views/list_movies_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color.fromRGBO(120, 120, 120, 1)
        // ),
        brightness: Brightness.dark
      ),
      home: const ListMoviesPage()
    );
  }
}
