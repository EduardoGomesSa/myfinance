import 'package:get/get.dart';
import 'package:myfinance/app/controllers/auth_controller.dart';
import 'package:myfinance/app/core/routes/app_routes_pages.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/income_model.dart';
import 'package:myfinance/app/repositories/income_repository.dart';

class IncomeController extends GetxController{
  final AuthController auth;
  final IncomeRepository repository;
  final AppUtils appUtils;

  IncomeController({
    required this.auth,
    required this.repository,
    required this.appUtils
  });

  @override
  void onInit(){
    super.onInit();

    getIncomes();
  }

  RxBool isLoading = false.obs;
  IncomeModel income = IncomeModel();
  RxList<IncomeModel> listIncome = RxList<IncomeModel>([]); 

  Future post() async {
    isLoading.value = true;

    String token = auth.user.token!;
    income.user = auth.user;

    ApiResult<IncomeModel> result = await repository.insert(token: token, income: income);

    if(!result.isError){
      income = result.data!;

      appUtils.showToast(message: "Ganho cadastrado com sucesso!");

      Get.offAllNamed(AppRoutes.base);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future getIncomes() async {
    isLoading.value = true;

    //String token = auth.user.token!;

    ApiResult<List<IncomeModel>> result = await repository.getAll(auth.user.token!);

    if(!result.isError){
      listIncome.assignAll(result.data!);
    }else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}