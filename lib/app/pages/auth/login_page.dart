import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/routes/app_routes_pages.dart';
import 'package:myfinance/app/core/services/validators.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

import '../../controllers/auth_controller.dart';

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
                        isSecret: true,
                        validator: passwordValidator),

                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(builder: (controller){
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)
                                )
                              ),
                              onPressed: controller.isLoading.value == true
                                ? null
                                : (){
                                  FocusScope.of(context).unfocus();

                                  if(_formKey.currentState!.validate()){
                                    String email = emailTextController.text;
                                    String password = passwordTextController.text;
                                    controller.signIn(
                                      email: email, password: password);
                                  }
                                },
                              child: controller.isLoading.value == true
                              ? const CircularProgressIndicator(
                                backgroundColor: Colors.white)
                                : const Text(
                                  'Entrar',
                                  style: TextStyle(fontSize: 16),
                                ) 
                              );
                          }),
                        )
                    ],
                  )
                ),
              ),

              SizedBox(
                height: 30,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    )
                  ),

                  onPressed: (){
                    Get.toNamed(AppRoutes.register);
                  },

                  child: const Text("Não possui uma conta? Crie uma agora mesmo",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryText,
                    decoration: TextDecoration.underline
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}