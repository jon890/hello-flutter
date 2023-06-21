import 'package:flutter/material.dart';
import 'package:helloflutter/models/webtoon_model.dart';
import 'package:helloflutter/widgets/webtoon_detail_screen.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel model;

  const Webtoon({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return WebtoonDetailScreen(model: model);
                },
                fullscreenDialog: true));
      },
      child: Column(
        children: [
          Hero(
            tag: model.id,
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
                model.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(model.title, style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
