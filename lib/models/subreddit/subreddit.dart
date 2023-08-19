import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

part 'subreddit.freezed.dart';
part 'subreddit.g.dart';

@freezed
class Subreddit with _$Subreddit {
  const factory Subreddit({
    required String subreddit,
    required String selftext,
    required String author_fullname,
    required bool saved,
    required String title,
    required String subreddit_name_prefixed,
    required bool hidden,
    required int ups,
    required int downs,
    required double upvote_ratio,
    required int num_comments
  }) = _Subreddit;

  factory Subreddit.fromJson(Map<String, dynamic> json) =>
      _$SubredditFromJson(json);
}
