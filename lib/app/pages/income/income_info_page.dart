import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/core/widgets/expense_widget.dart';
import 'package:myfinance/app/models/expense_model.dart';
import 'package:myfinance/app/models/income_model.dart';
import '../bill/bill_form_page.dart';

class IncomeInfoPage extends StatelessWidget {
  const IncomeInfoPage({
    Key? key,
    required this.income,
    required this.appUtils,
  }) : super(key: key);

  final IncomeModel income;
  final AppUtils appUtils;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações do ganho"),
        backgroundColor: AppColors.backgroundComponent,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        appUtils.formatDateTime(income.created!),
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.backgroundComponent,
                        ),
                      ),
                      Text(
                        "${income.title}",
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.backgroundComponent,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundComponent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Valor Inicial: ",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.primaryText),
                              ),
                              Text(
                                "R\$${income.value}",
                                style: const TextStyle(
                                    fontSize: 16, color: AppColors.primaryText),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Restante: ",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.primaryText),
                              ),
                              Text(
                                "${income.remained}",
                                style: const TextStyle(
                                    fontSize: 16, color: AppColors.primaryText),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: InkWell(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BillFormPage(
                                        incomeModel: income,
                                      )),
                            );
                          },
                          child: const Text(
                            "Adicionar conta",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ... restante do seu código ...
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: income.expenses?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    ExpenseModel? model = income.expenses?[index];

                    return model != null
                        ? ExpenseWidget(model: model)
                        : Container(); // Retorna um Container vazio se o modelo for nulo.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
