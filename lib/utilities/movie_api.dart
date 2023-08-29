
import 'package:dio/dio.dart';
import 'package:entry_test_movie_api/model/Results.dart';

import '../model/Page.dart';

class MovieApiService {
  final Dio dio = Dio();
  final String urlPath = "https://api.themoviedb.org/3/discover/movie";
  final String apiKey = "26763d7bf2e94098192e629eb975dab0";
  List<Results> allResults = [];

  Future<List<Results>> fetchMovie(int page) async{

    final queryParams = {"api_key": "26763d7bf2e94098192e629eb975dab0", "page": page};
    try{
      final response = await  dio.get(urlPath, queryParameters:  queryParams);


      if(response.statusCode == 200){

        final pageData = Page.fromJson(response.data);
        print("object page");
        allResults = [];
        allResults.addAll(pageData.results);
        return allResults;
      }else{
        throw Exception("Failed to fetch data");
      }
    }catch(e) {
      throw Exception("network 1 $e");

    }

  }



}