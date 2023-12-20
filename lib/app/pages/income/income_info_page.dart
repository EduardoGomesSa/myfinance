import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/models/income_model.dart';

class IncomeInfoPage extends StatelessWidget{
  const IncomeInfoPage({Key? key, required this.income}) : super(key: key);

  final IncomeModel income;

  //final _formKey = GlobalKey<FormState>();

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
          child: Column(
           children: [
            Text(
              "${income.title}",
              style: const TextStyle(
                fontSize: 24, color: AppColors.primaryText
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: 130,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(12) 
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                  )
                ],
              ),
            )
           ], 
          )
        )
      ),
    );
  }
}