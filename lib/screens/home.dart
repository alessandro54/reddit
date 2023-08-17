import 'package:flutter/material.dart';
import 'package:reddit/models/sub_reddit/sub_reddit.dart';
import 'package:reddit/providers/reddit/login.dart';
import 'package:reddit/providers/reddit_provider.dart';
import 'package:reddit/widgets/shared/layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  late Future<Map<String, dynamic>> message;

  @override
  void initState() {
    super.initState();
    message = login('indifference44', dotenv.env['FLUTTER_APP_PASSWORD']!);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        topBar: const Text('Home'),
        child: Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
                future: RedditProvider().fetchBest(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data!['data']['children'];
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        Subreddit subReddit = Subreddit.fromJson(items[index]['data']);

                        return Container(
                          height: 40,
                          color: Colors.amber,
                          child: Center(
                            child: Text(
                              subReddit.title,
                              style: const TextStyle(fontSize: 18),
                            )
                          )
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}",
                        style: const TextStyle(color: Colors.white));
                  }
                  return const CircularProgressIndicator();
                })));
  }
}
