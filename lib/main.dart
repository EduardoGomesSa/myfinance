import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/core/config/app_colors.dart';

import 'app/core/routes/app_routes_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Finances",
      theme: ThemeData(
        primaryColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          color: AppColors.background,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 1,
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
    );
  }
}
