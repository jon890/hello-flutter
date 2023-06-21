import 'package:flutter/material.dart';
import 'package:helloflutter/services/api_service.dart';

import '../models/webtoon_model.dart';

class WebtoonScreen extends StatelessWidget {
  WebtoonScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("오늘의 웹툰",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var webtoon = snapshot.data?[index];

                  return Text("${webtoon?.title ?? ""}");
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
