import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_count > 0) IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => setState(() => _count--),
          iconSize: 50,
        ) else SizedBox(width: 60),
        Text('$_count', style: const TextStyle(fontSize: 24)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(() => _count++),
          iconSize: 50,
        )
      ],
    );
  }
}
