import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class BillFormPage extends StatelessWidget{
  BillFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();


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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        icon: Icons.title, 
                        label: "Nome da conta"),
                      TextFieldWidget(
                        icon: Icons.numbers, 
                        label: "Valor da conta")
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