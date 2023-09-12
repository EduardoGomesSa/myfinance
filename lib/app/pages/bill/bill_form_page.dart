import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/bill_controller.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class BillFormPage extends StatelessWidget{
  BillFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final billTextController = TextEditingController();
  final expenseTextController = TextEditingController();

  final controllerBill = Get.find<BillController>(); 


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
                      const TextFieldWidget(
                        icon: Icons.title, 
                        label: "Nome da conta"),
                      const TextFieldWidget(
                        icon: Icons.numbers, 
                        label: "Valor da conta"),

                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 50,
                        child: GetX<BillController>(builder: (controller){
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)
                              ),
                            ),
                            onPressed: controller.isLoading.value == true
                              ? null
                              : (){
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
                                "Cadastrar",
                                style: TextStyle(fontSize: 16),
                              )
                          );
                        }),
                      )
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