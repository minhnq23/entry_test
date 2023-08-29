
import 'package:entry_test_movie_api/model/Results.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget{
   Item({super.key, required this.result});
   final Results result;


  @override
  Widget build(BuildContext context) {
  return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/original${result.posterPath}',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 5,
              right: 5,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xfff5835b),
                        Color(0xffda0101),

                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                      children: <TextSpan>[
                        TextSpan(text: intPoint(result.voteAverage.toString()), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        TextSpan(text: '.${lastNum(result.voteAverage.toString())}' ,style: const TextStyle(fontSize: 13)),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin:const  EdgeInsets.only(left: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      exportYear(result.releaseDate),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      result.title.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      );
  }
   String exportYear(String dateString) {
     List<String> parts = dateString.split("-");
     String year = parts[0];

     return year;
   }
   String intPoint(String str){
    String firstNum = str.substring(0,1);
    return firstNum;
   }
   String lastNum(String str){
     String afterNum = str.substring(2);
    return afterNum;
   }


}