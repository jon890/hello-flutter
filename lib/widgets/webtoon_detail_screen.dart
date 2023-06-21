import 'package:flutter/material.dart';
import 'package:helloflutter/models/webtoon_episode_model.dart';
import 'package:helloflutter/models/webtoon_model.dart';

import '../models/webtoon_detail_model.dart';
import '../services/api_service.dart';

class WebtoonDetailScreen extends StatefulWidget {
  const WebtoonDetailScreen({super.key, required this.model});

  final WebtoonModel model;

  @override
  State<WebtoonDetailScreen> createState() => _WebtoonDetailScreenState();
}

class _WebtoonDetailScreenState extends State<WebtoonDetailScreen> {
  late Future<WebtoonDetailModel> detail;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    detail = ApiService.getToonById(widget.model.id);
    episodes = ApiService.getLatestEpisodesById(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.model.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.model.id,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: Offset(10, 10),
                            color: Colors.black.withOpacity(0.5))
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.model.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.about,
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 15),
                        Text("${snapshot.data!.genre} / ${snapshot.data!.age}",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  );
                }

                return Text("...");
              },
              future: detail)
        ],
      ),
    );
  }
}
