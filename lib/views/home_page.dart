// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/counter.dart';
import 'package:learn_flutter/my_drawer.dart';
import 'package:learn_flutter/views/list_page.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Mon Application'),
      ),
      drawer: MyDrawer(),
      body: ListView(
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
          ),
          Row(
            children: [
              Image.asset(
                'images/cat.jpg',
                width: MediaQuery.of(context).size.width
              )
            ]
          ),
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                placeholder: (context, url) => CircularProgressIndicator(),
                width: screenWidth / 3,
              ),
              Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', width: screenWidth / 3),
              Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', width: screenWidth / 3)
            ]
          ),
          Counter(),
          ElevatedButton(
            child: Text('Voir la liste'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ListPage())
            ),
          )
        ],
      )
    );
  }
}
