import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class IncomeFormPage extends StatelessWidget{
  IncomeFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final incomeTextController = TextEditingController();

  final controllerIncome = Get.find<IncomeController>();


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
                        label: "Ganho"),

                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 50,
                        child: GetX<IncomeController>(builder: (controller){
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            onPressed: controller.isLoading.value == true
                              ? null 
                              :() {
                                FocusScope.of(context).unfocus();

                                if(_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();

                                  controller.post();
                                }
                              }, 
                            child: controller.isLoading.value == true
                              ? const CircularProgressIndicator(
                                backgroundColor: Colors.white)
                              : const Text(
                                'Cadastrar',
                                style: TextStyle(fontSize: 16),
                              ),
                          );
                        }),
                      ),
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