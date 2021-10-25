import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/source_entity.dart';

import '../source_model.dart';

class SourceSerializer implements JsonConverter<List<SourceEntity>, Map> {
  const SourceSerializer();

  @override
  List<SourceEntity> fromJson(Map json) {
    final list = json['sources'] as List<dynamic>;
    final result =
        list.map((e) => mapToSource(e as Map<String, dynamic>)).toList();
    return result;
  }

  @override
  Map toJson(List<SourceEntity> object) {
    return <String, dynamic>{
      'sources': object.map((entity) {
        final map = sourceToMap(entity);
        return map;
      }).toList(),
    };
  }

  Map<String, dynamic> sourceToMap(SourceEntity entity) {
    return {
      "title": entity.title,
      "slug": entity.slug,
      "url": entity.url,
      "crawl_rate": entity.crawlRate,
    };
  }

  SourceModel mapToSource(Map<String, dynamic> json) {
    return SourceModel(
      title: json["title"] as String,
      slug: json["slug"] as String,
      url: json["url"] as String,
      crawlRate: json["crawl_rate"] as int,
    );
  }
}
