import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  final WebtoonEpisodeModel episode;
  final String webtoonId;

  const Episode({super.key, required this.episode, required this.webtoonId});

  onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=${webtoonId}&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(10, 10),
                  color: Colors.black.withOpacity(0.5))
            ],
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    episode.title,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Icon(Icons.chevron_right_rounded, color: Colors.white)
                ]),
          )),
    );
  }
}
