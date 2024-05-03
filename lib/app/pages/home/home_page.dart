import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/core/widgets/income_widget.dart';
import 'package:myfinance/app/models/income_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.appUtils});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final IncomeController controller = Get.find();
  final AppUtils appUtils;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: AppColors.backgroundComponent,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getIncomes();
        },
        child: GetX<IncomeController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<IncomeModel> sortedList = List.from(controller.listIncome);
              sortedList.sort((b, a) => a.created!.compareTo(b.created!));

              List<Widget> widgets = [];

              // Variável para armazenar o mês e ano do modelo anterior
              String previousMonthAndYear = '';

              // Percorre os modelos classificados
              for (int index = 0; index < sortedList.length; index++) {
                IncomeModel model = sortedList[index];

                // Obtém o mês e ano do modelo atual
                String currentMonthAndYear =
                    '${model.created?.month} - ${model.created?.year}';

                // Se a data do modelo atual for diferente da anterior,
                // adiciona uma linha de separação
                if (currentMonthAndYear != previousMonthAndYear) {
                  // Adiciona a linha com o mês e ano
                  widgets.add(
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(200),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              appUtils.formatDateTimeHome(model.created!),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.grey.withAlpha(200),
                            thickness: 2,
                          ))
                        ],
                      ),
                    ),
                  );

                  // Atualiza o mês e ano anterior para o atual
                  previousMonthAndYear = currentMonthAndYear;
                }

                // Adiciona o widget do modelo atual
                widgets.add(IncomeWidget(model: model));
              }

              return ListView(
                physics: const BouncingScrollPhysics(),
                children: widgets,
              );
            }
          },
        ),
      ),
    );
  }
}
