import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  final Map meal;

  const SinglePage(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal['name']),
      ),
      body: Column(children: [
        Hero(
          tag: 'meal-${meal['name']}',
          child: Image.network(meal['image'], width: width),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(meal['name'], style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
            ]
          ),
        ),
        Text('${meal['price']} €', style: const TextStyle(fontSize: 20)),
      ])
    );
  }
}
