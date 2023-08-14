import 'package:get/get.dart';

import 'package:myfinance/app/core/routes/app_routes_pages.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/user_model.dart';
import 'package:myfinance/app/repositories/auth_repository.dart';

class AuthController extends GetxController{
  final AuthRepository repository;
  final AppUtils appUtils;

  AuthController({
    required this.repository,
    required this.appUtils,
  });
 
  RxBool isLoading = false.obs;
  UserModel user = UserModel();

  // @override
  // void onInit(){
  //   super.onInit();


  // }

  Future signUp() async {
    isLoading.value = true;

    
  }

  Future signIn({required String email, required String password}) async {
    isLoading.value = true;

    ApiResult<UserModel> result = 
      await repository.signIn(email: email, password: password);

      if(!result.isError){
        user = result.data!;
        Get.offAllNamed(AppRoutes.base);
      } else {
        appUtils.showToast(message: result.message!, isError: true);
      }

      isLoading.value = false;
  }
}