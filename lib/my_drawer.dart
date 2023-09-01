import 'package:flutter/material.dart';
import 'package:learn_flutter/views/home_page.dart';
import 'package:learn_flutter/views/list_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Accueil'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage())
            ),
          ),
          ListTile(
            title: const Text('Les films'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ListPage())
            ),
          ),
        ],
      ),
    );
  }
}
