import 'package:get/get.dart';
import 'package:myfinance/app/controllers/bill_controller.dart';
import 'package:myfinance/app/repositories/bill_repository.dart';

class BillBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(BillRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(BillController(
      auth: Get.find(), 
      incomeController: Get.find(), 
      repository: Get.find(), 
      expenseRepository: Get.find(), 
      appUtils: Get.find())
    );
  }
}