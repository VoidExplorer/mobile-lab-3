import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_lab_3/screens/home_screen.dart';
import 'package:mobile_lab_3/totals_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TotalsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
