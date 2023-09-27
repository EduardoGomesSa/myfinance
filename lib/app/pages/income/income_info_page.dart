import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/models/income_model.dart';

class IncomeInfoPage extends StatelessWidget{
  IncomeInfoPage({Key? key, required this.income}) : super(key: key);

  final IncomeModel income;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: const Column(
           children: [
            Text("Aqui ficará um botão")
           ], 
          )
        )
      ),
    );
  }
}