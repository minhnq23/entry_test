import 'package:entry_test_movie_api/controllers/main_controller.dart';
import 'package:entry_test_movie_api/utilities/my_material_app.dart';
import 'package:entry_test_movie_api/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

   // Khởi tạo controller ở cấp cao hơn
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   final MainController controller = Get.put(MainController());


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MyMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black),
            onPressed: () {},
          ),
          title: const Text("Back" , style: TextStyle(color: Colors.black),),
        ),
        body:  Column(
          children: [
             Container(
               alignment: Alignment.centerLeft,
               child: const Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text(
                  'Popular list',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
            ),
             ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                
                child: Obx(() {
                  if(controller.movieResults.isEmpty){
                    return const Center(child: CircularProgressIndicator());
                  }else{
                    return  RefreshIndicator(
                      onRefresh: () async { controller.refreshMovies(); },
                      child: GridView.builder(
                        padding: const EdgeInsets.all(5),
                        controller: controller.scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          
                          mainAxisSpacing: 14.0,
                          crossAxisSpacing: 14.0,
                          childAspectRatio: 40/60
                        ),
                        itemCount: controller.movieResults.length,
                        itemBuilder: (context, index) {
                          final movie = controller.movieResults[index];
                          return Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey, // Màu của bóng
                                  blurRadius: 10.0, // Độ mờ của bóng
                                  spreadRadius: 2.0, // Độ lan rộng của bóng
                                  offset: Offset(4, 4), // Vị trí của bóng (x, y)
                                ),
                              ],
                            ),
                              child: Item(result: movie));

                        },
                      ),
                    );
                  }

                }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
