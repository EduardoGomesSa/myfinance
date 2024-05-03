import 'package:get/get.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/repositories/income_repository.dart';

class IncomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(AppUtils());
    Get.put(IncomeRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(IncomeController(auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}