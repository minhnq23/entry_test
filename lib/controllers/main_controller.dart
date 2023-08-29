import 'package:entry_test_movie_api/utilities/movie_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/Results.dart';

class MainController extends GetxController {
  final MovieApiService apiService = MovieApiService();
  final scrollController = ScrollController();
  var movieResults = <Results>[].obs;
  int index  = 1;

  @override
  void onInit() {
    super.onInit();
    print("hihi");
    fetchMovies(1);
    scrollController.addListener(() {
      scrollListener();
    });
  }
  // load more
  void scrollListener() {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      print("to load data");
      fetchMovies(index);
    }else{
      // print("scrollListener");
    }

  }

  // pull to refresh
  Future<void> refreshMovies() async {
    movieResults.clear();
    print("refreshMovies");
    index = 1;
    fetchMovies(1);

  }

  void fetchMovies(int page) async {
    try {
      final results = await apiService.fetchMovie(page);
      movieResults.addAll(results);
      print(
          'movie length${movieResults.length}');
      index++;
      if(index == 6){
        index = 10;
      }
      // page 6 && 8 bị lỗi cấu trúc khác vs các page khác
      print('index: $index');
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }
}
