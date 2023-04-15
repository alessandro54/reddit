// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_reddit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subreddit _$$_SubredditFromJson(Map<String, dynamic> json) => _$_Subreddit(
      subreddit: json['subreddit'] as String,
      selftext: json['selftext'] as String,
      author_fullname: json['author_fullname'] as String,
      saved: json['saved'] as bool,
      title: json['title'] as String,
      subreddit_name_prefixed: json['subreddit_name_prefixed'] as String,
      hidden: json['hidden'] as bool,
      downs: json['downs'] as int,
      num_comments: json['num_comments'] as int,
      ups: json['ups'] as int,
    );

Map<String, dynamic> _$$_SubredditToJson(_$_Subreddit instance) =>
    <String, dynamic>{
      'subreddit': instance.subreddit,
      'selftext': instance.selftext,
      'author_fullname': instance.author_fullname,
      'saved': instance.saved,
      'title': instance.title,
      'subreddit_name_prefixed': instance.subreddit_name_prefixed,
      'hidden': instance.hidden,
      'downs': instance.downs,
      'num_comments': instance.num_comments,
      'ups': instance.ups,
    };
