import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuário"),
        backgroundColor: AppColors.backgroundComponent,
      ),
      body: Container(
        child: Text("profile Page"),
      ),
    );
  }
}