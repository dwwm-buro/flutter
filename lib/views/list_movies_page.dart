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

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 430,
              // childAspectRatio: 0.75
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Map movie = movies[index];

              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      movie['poster_path'],
                      height: 350,
                      // width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(movie['title'], textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateTime.parse(movie['release_date']).year.toString()),
                      SizedBox(width: 40),
                      Icon(Icons.star, size: 15, color: Colors.yellow),
                      SizedBox(width: 5),
                      Text(movie['vote_average'].toStringAsFixed(1) + '/10')
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
      // backgroundColor: Colors.blueGrey,
    );
  }
}
