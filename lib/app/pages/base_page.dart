import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/pages/home/home_page.dart';
import 'package:myfinance/app/pages/income/income_form_page.dart';
import 'package:myfinance/app/pages/profile/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>{
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            HomePage(),
            IncomeFormPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primaryText,
          unselectedItemColor: AppColors.secundaryText,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_card_outlined),
              label: "Add Income"),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: "Profile"),
          ],
        ),
      )
    );
  }
}