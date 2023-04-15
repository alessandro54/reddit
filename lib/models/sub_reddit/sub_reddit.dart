import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sub_reddit.freezed.dart';

part 'sub_reddit.g.dart';

@freezed
class Subreddit with _$Subreddit {
  const factory Subreddit(
      {required String subreddit,
      required String selftext,
      required String author_fullname,
      required bool saved,
      required String title,
      required String subreddit_name_prefixed,
      required bool hidden,
      required int downs,
      required int num_comments,
      required int ups}) = _Subreddit;

  factory Subreddit.fromJson(Map<String, dynamic> json) =>
      _$SubredditFromJson(json);
}
