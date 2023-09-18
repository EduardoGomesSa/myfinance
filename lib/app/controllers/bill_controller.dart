import 'package:get/get.dart';
import 'package:myfinance/app/controllers/auth_controller.dart';
import 'package:myfinance/app/controllers/income_controller.dart';
import 'package:myfinance/app/core/routes/app_routes_pages.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/bill_model.dart';
import 'package:myfinance/app/models/expense_model.dart';
import 'package:myfinance/app/repositories/bill_repository.dart';
import 'package:myfinance/app/repositories/expense_repository.dart';

class BillController extends GetxController{
  final AuthController auth;
  final IncomeController incomeController;
  final BillRepository repository;
  final ExpenseRepository expenseRepository;
  final AppUtils appUtils;

  BillController({
    required this.auth,
    required this.incomeController,
    required this.repository,
    required this.expenseRepository,
    required this.appUtils
  });

  RxBool isLoading = false.obs;
  BillModel bill = BillModel();
  ExpenseModel expense = ExpenseModel();

  Future post() async {
    isLoading.value = true;

    String token = auth.user.token!;

    ApiResult<BillModel> result = await repository.insert(token: token, bill: bill);

    if(!result.isError){
      bill = result.data!;

      expense.bill = bill;
      expense.income = incomeController.income;

      ApiResult<ExpenseModel> resultExpense = await expenseRepository.insert(token: token, expense: expense);

      if(!resultExpense.isError){
        appUtils.showToast(message: "Gasto cadastrado com sucesso");

        Get.offAllNamed(AppRoutes.base);
      } else {
        appUtils.showToast(message: resultExpense.message!, isError: true);
      }
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}