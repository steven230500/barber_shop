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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Barber ticket shop'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            int takeNumber = Random().nextInt(100);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      1),
                  title: Text('Ticket'),
                  content: Text('Su ticket es el $takeNumber'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok'))
                  ],
                );
              },
            );
          },
          tooltip: 'Tomar ticket',
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(onPressed: () {}, child: const Text('Tomar ticket')),
              ),
            ],
          ),
        ));
  }
}
