import 'package:flutter/material.dart';

class WebtoonScreen extends StatelessWidget {
  const WebtoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("오늘의 웹툰",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
    );
  }
}
