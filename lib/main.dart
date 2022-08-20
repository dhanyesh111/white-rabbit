import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:white_rabit/appPages/app_pages.dart';
import 'package:white_rabit/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'White Rabbit',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Color.fromRGBO(225, 255, 255, 1)),
        scaffoldBackgroundColor: const Color.fromRGBO(37, 37, 37, 1),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: const Color.fromRGBO(37, 37, 37, 1),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: const Color.fromRGBO(225, 255, 255, 1),
                displayColor: const Color.fromRGBO(225, 255, 255, 1),
              )
              .bodyText2,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromRGBO(225, 255, 255, 1),
              displayColor: const Color.fromRGBO(225, 255, 255, 1),
            ),
      ),
      initialRoute: employeeListingPage,
      getPages: AppPages.appPages,
    );
  }
}
