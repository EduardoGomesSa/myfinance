import 'package:get/get.dart';
import 'package:myfinance/app/pages/home/home_page.dart';

import '../../pages/base_page.dart';

abstract class AppPages{
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base, 
      page: () => const BasePage()
    ),
    GetPage(
      name: AppRoutes.home, 
      page: () => const HomePage())
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
}