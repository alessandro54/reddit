import 'package:flutter/material.dart';
import 'package:reddit/models/subreddit/subreddit.dart';
import 'package:reddit/providers/reddit/login.dart';
import 'package:reddit/providers/reddit_provider.dart';
import 'package:reddit/widgets/best_subreddit.dart';
import 'package:reddit/widgets/shared/layout.dart';

import '../providers/secrets_provider.dart';

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
    SecretsProvider secretsProvider = SecretsProvider();
    message = login('indifference44', secretsProvider.password);
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
                    return ListView.separated(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return BestSubreddit(
                            subreddit:
                                Subreddit.fromJson(items[index]['data']));
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
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
