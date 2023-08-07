import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.primary),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryText),
            )
          ],
        ),
      ),
    );
  }
}