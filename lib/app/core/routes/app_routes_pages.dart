import 'package:get/get.dart';
import 'package:myfinance/app/bindings/app_binding.dart';
import 'package:myfinance/app/bindings/income_binding.dart';
import 'package:myfinance/app/pages/auth/login_page.dart';
import 'package:myfinance/app/pages/home/home_page.dart';
import 'package:myfinance/app/pages/income/income_form_page.dart';
import 'package:myfinance/app/pages/profile/profile_page.dart';
import 'package:myfinance/app/pages/splash_page.dart';

import '../../pages/base_page.dart';

abstract class AppPages{
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base, 
      page: () => const BasePage(),
      bindings: [
        AppBinding(),
        IncomeBinding()
      ]
    ),
    GetPage(
      name: AppRoutes.home, 
      page: () => const HomePage()
    ),
    GetPage(
      name: AppRoutes.splash, 
      page: () => const SplashPage()
    ),
    GetPage(
      name: AppRoutes.profile, 
      page: () => const ProfilePage()
    ),
    GetPage(
      name: AppRoutes.login, 
      page: () => LoginPage()
    ),
    GetPage(
      name: AppRoutes.addIncome, 
      page: () => IncomeFormPage()
    )
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String addIncome = '/add_income';
}