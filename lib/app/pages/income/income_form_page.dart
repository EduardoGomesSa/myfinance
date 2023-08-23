import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class IncomeFormPage extends StatelessWidget{
  IncomeFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final incomeTextController = TextEditingController();


  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        controller: incomeTextController,
                        icon: Icons.money, 
                        label: "Ganho")
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}