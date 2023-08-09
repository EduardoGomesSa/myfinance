import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';

class LoginPage extends StatelessWidget{
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Aqui ficará uma imagem"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(29.0),
                child: Form(
                  key: _formKey,
                  child: Column(

                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}