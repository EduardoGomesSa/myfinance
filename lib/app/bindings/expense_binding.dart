 import 'package:get/get.dart';
import 'package:myfinance/app/repositories/expense_repository.dart';

class ExpenseBinding extends Bindings{
  @override 
  void dependencies(){
    Get.put(ExpenseRepository(httpManager: Get.find(), appUtils: Get.find()));
  }
}