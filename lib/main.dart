import 'package:flutter/material.dart';
import 'package:helloflutter/screens/webtoon_screen.dart';
import 'package:helloflutter/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WebtoonScreen());
  }
}
