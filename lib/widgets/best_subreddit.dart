import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:reddit/providers/reddit_provider.dart';

import '../models/subreddit/subreddit.dart';

class BestSubreddit extends StatelessWidget {
  final Subreddit subreddit;

  const BestSubreddit({super.key, required this.subreddit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(15, 15, 16, 1),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FutureBuilder(
                              future: RedditProvider()
                                  .fetchAbout(subreddit.subreddit),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Map<String, dynamic> subredditAbout =
                                      snapshot.data?['data'];
                                  String imageUrl =
                                      subredditAbout['community_icon'];
                                  if (imageUrl == "") {
                                    imageUrl = subredditAbout['icon_img'];
                                  }
                                  return CircleAvatar(
                                      radius: 10,
                                      backgroundImage: NetworkImage(
                                          parse(imageUrl)
                                              .documentElement!
                                              .text));
                                }
                                return const Text('Error');
                              }),
                          Column(
                            children: [
                              Text(subreddit.subreddit_name_prefixed,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(206, 209, 212, 1),
                                      fontSize: 10))
                            ],
                          )
                        ],
                      ),
                      const Icon(CupertinoIcons.ellipsis,
                          color: Color.fromRGBO(206, 209, 212, 1)),
                    ]),
              ],
            )));
  }
}
