import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

sToJson(s) {
  // const toJson();
  return s;
}

fromSJson(dynamic json) {
  return Source(
    json['id'],
    json['name'],
  );
}

@JsonSerializable(explicitToJson: true)
class NewsModel {
  @JsonKey(
    toJson: sToJson,
    fromJson: fromSJson,
  )
  final Source source;
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  const NewsModel({
    @required this.source,
    @required this.title,
    @required this.author,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });

  factory NewsModel.fromJson(Map json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

class Source {
  const Source(this.id, this.name);
  final String id;
  final String name;
}

// class _Converter implements JsonConverter {
//   const _Converter();
//   @override
//   fromJson(json) {
//     return Source(
//       json['id'],
//       json['name'],
//     );
//   }

//   @override
//   Map toJson(source) {
//     return {
//       "id": source.id,
//       "name": source.name,
//     };
//   }
// }
