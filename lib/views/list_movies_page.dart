import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_flutter/my_drawer.dart';
import 'package:http/http.dart' as http;

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({super.key});

  @override
  State<ListMoviesPage> createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  List movies = [];

  Future<List> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    http.Response response = await http.get(Uri.parse('https://api.vueflix.boxydev.com/movies'));

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // fetchMovies().then((value) => print(value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('FluFix'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          movies = snapshot.data as List;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Map movie = movies[index];

              return Text(movie['title']);
            },
          );
        },
      ),
    );
  }
}
