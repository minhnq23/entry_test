import 'Results.dart';

class Page {
  Page({
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,});

  Page.fromJson(dynamic json) {
    print("page from json 0");
    page = json['page'] as int;
    print("page from json 0.1");
    results = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    print("page from json 0.2");
    totalPages = json['total_pages'];
    print("page from json 1");
    totalResults = json['total_results'];

    print("page from json 2");
  }
  int page= 0;
  List<Results> results = [];
  int totalPages = 0;
  int  totalResults = 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}