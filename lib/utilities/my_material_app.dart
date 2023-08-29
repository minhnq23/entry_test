import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:get/get.dart';

class MyMaterialApp extends GetMaterialApp{
   MyMaterialApp({
    Key? key,
    String title="",
    bool debugShowCheckedModeBanner = false, required home,
  }) : super(
    key: key,
    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
     home: home,
  );
  @override
  // TODO: implement debugShowCheckedModeBanner
  bool get debugShowCheckedModeBanner => false;

}