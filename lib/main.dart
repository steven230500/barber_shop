import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber ticket',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Barber ticket shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> tickets = [];
  void takeTickets() {
    int takeNumber = Random().nextInt(100);
    setState(() {
      tickets.add(takeNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: takeTickets,
        tooltip: 'Tomar ticket',
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        itemCount: tickets.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.confirmation_num,
                      size: 50, color: Colors.pinkAccent),
                  Text(
                    'Turnito ${tickets[index]}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
