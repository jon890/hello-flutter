import 'package:flutter/material.dart';
import 'package:helloflutter/widgets/currency_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF181818), body: CurrencyPage()),
    );
  }
}
