import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/services/validators.dart';

import '../../controllers/auth_controller.dart';
import '../../core/widgets/text_field_widget.dart';

class RegisterPage extends StatelessWidget{
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmedTextController = TextEditingController(); 

  final controller = Get.find<AuthController>();

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        controller: nameTextController,
                        icon: Icons.person,
                        label: "Nome",
                        validator: nameValidator,
                        onSaved: (value) {
                          controller.user.name = value;
                        },
                      ),

                      TextFieldWidget(
                        controller: emailTextController,
                        icon: Icons.email,
                        label: "Email",
                        validator: emailValidator,
                        onSaved: (value) {
                          controller.user.email = value;
                        },
                      ),

                      TextFieldWidget(
                        controller: passwordTextController,
                        icon: Icons.password, 
                        label: "Senha",
                        isSecret: true,
                        validator: passwordValidator,
                        onSaved: (value) {
                          controller.user.password = value;
                        },
                      ),
            
                      TextFieldWidget(
                        controller: passwordConfirmedTextController,
                        icon: Icons.lock, 
                        label: "Confirmar senha",
                        isSecret: true,
                        validator: passwordValidator
                      ),
                    ]
                    
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