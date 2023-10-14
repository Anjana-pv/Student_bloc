import 'package:block_todo/screens/home/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
      colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const TodoScreeen(),
    );
  }
}

