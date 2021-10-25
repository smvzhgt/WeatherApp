import 'package:equatable/equatable.dart';

class SourceEntity extends Equatable {
  final String title;
  final String slug;
  final String url;
  final int crawlRate;

  const SourceEntity({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });

  const SourceEntity.empty({
    this.title = '',
    this.slug = '',
    this.url = '',
    this.crawlRate = 0,
  });

  @override
  List<Object?> get props => [title, slug, url, crawlRate];
}
