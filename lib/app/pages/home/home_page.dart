import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/widgets/income_widget.dart';
import 'package:myfinance/app/models/income_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final IncomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
              List<IncomeModel> sortedList =
                  List.from(controller.listIncome);
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black, // Cor da linha
                                    width: 2, // Largura da linha
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              currentMonthAndYear,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black, // Cor da linha
                                    width: 2, // Largura da linha
                                  ),
                                ),
                              ),
                            ),
                          ),
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
