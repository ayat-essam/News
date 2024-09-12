class NewsResponse {
  late String status;
  late int totalResults;
  late List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles.add(Article.fromJson(v));
      });
    } else {
      articles = [];
    }
  }

  NewsResponse copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) => NewsResponse(
    status: status ?? this.status,
    totalResults: totalResults ?? this.totalResults,
    articles: articles ?? this.articles,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['articles'] = articles.map((v) => v.toJson()).toList();
    return map;
  }
}

class Article {
  late Source source;
  String? author;
  late String title;
  late String description;
  late String url;
  String? urlToImage;
  late DateTime publishedAt;
  late String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateTime.parse(json['publishedAt']);
    content = json['content'];
  }

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) => Article(
    source: source ?? this.source,
    author: author ?? this.author,
    title: title ?? this.title,
    description: description ?? this.description,
    url: url ?? this.url,
    urlToImage: urlToImage ?? this.urlToImage,
    publishedAt: publishedAt ?? this.publishedAt,
    content: content ?? this.content,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = source.toJson();
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt.toIso8601String();
    map['content'] = content;
    return map;
  }
}

class Source {
  late String id;
  late String name;

  Source({
    required this.id,
    required this.name,
  });

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Source copyWith({
    String? id,
    String? name,
  }) => Source(
    id: id ?? this.id,
    name: name ?? this.name,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
