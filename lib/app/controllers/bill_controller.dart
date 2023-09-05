import 'package:get/get.dart';
import 'package:myfinance/app/controllers/auth_controller.dart';
import 'package:myfinance/app/core/routes/app_routes_pages.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/bill_model.dart';
import 'package:myfinance/app/repositories/bill_repository.dart';

class BillController extends GetxController{
  final AuthController auth;
  final BillRepository repository;
  final AppUtils appUtils;

  BillController({
    required this.auth,
    required this.repository,
    required this.appUtils
  });

  RxBool isLoading = false.obs;
  BillModel bill = BillModel();

  Future post() async {
    isLoading.value = true;

    String token = auth.user.token!;

    ApiResult<BillModel> result = await repository.insert(token: token, bill: bill);

    if(!result.isError){
      bill = result.data!;

      appUtils.showToast(message: "Conta cadastrada com sucesso");

      Get.offAllNamed(AppRoutes.base);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}