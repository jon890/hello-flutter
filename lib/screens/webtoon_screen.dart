import 'package:flutter/material.dart';
import 'package:helloflutter/services/api_service.dart';
import 'package:helloflutter/widgets/webtoon_widget.dart';

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
              return Column(
                children: [
                  SizedBox(height: 50),
                  Expanded(child: makeList(snapshot))
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];

        return Webtoon(model: webtoon);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 40);
      },
    );
  }
}
