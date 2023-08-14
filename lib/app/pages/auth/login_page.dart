import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/services/validators.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget{
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Aqui ficará uma imagem"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        controller: emailTextController,
                        icon: Icons.email, 
                        label: 'Email',
                        validator: emailValidator
                      ),

                      TextFieldWidget(
                        controller: passwordTextController,
                        icon: Icons.password, 
                        label: 'Senha',
                        validator: passwordValidator)
                    ],
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