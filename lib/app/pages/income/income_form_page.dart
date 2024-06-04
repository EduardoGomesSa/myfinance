import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class IncomeFormPage extends StatelessWidget{
  IncomeFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final incomeValueTextController = TextEditingController();
  final incomeTitleTextController = TextEditingController();

  final controller = Get.find<IncomeController>();


  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + size.viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Adicionar um novo ganho'),
                TextFieldWidget(
                  controller: incomeTitleTextController,
                  icon: Icons.title, 
                  label: "Título",
                  onSaved: (value){
                    controller.income.title = value;
                  },),
                  
                TextFieldWidget(
                  controller: incomeValueTextController,
                  icon: Icons.money, 
                  label: "Ganho",
                  onSaved: (value){
                    int newValue = int.parse(value!); 
                    controller.income.value = newValue;
                  },),
                  
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
      ),
    );
  }
}