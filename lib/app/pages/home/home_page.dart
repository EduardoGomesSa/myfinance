import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/widgets/income_widget.dart';
import 'package:myfinance/app/models/income_model.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final IncomeController controller = Get.find();

  @override
  Widget build(BuildContext context){
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
          builder: (controller){
            if(controller.isLoading.value == true){
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.listIncome.length,
                itemBuilder: (BuildContext context, int index){
                  IncomeModel model = controller.listIncome[index];

                  return IncomeWidget(model: model);
                });
            }
          },
        ),
      ),
    );
  }
}