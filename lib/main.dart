import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxpro/controller/demoController.dart';
import 'package:getxpro/view/demoPage.dart';
import 'package:getxpro/view/home.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final DemoController ctrl = Get.put(DemoController());
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      // for darkmode instant change
      return GetMaterialApp(
        //for navigation dont forget to use GetMaterialApp
        title: 'Easy GetX',
        theme: ctrl.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          //routes for named navigation
          '/': (context) => HomePage(),
          '/cart': (context) => DemoPage(),
        },
      );
    });
  }
}
