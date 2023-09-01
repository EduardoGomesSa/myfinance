import 'package:get/get.dart';
import 'package:myfinance/app/controllers/auth_controller.dart';
import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/repositories/auth_repository.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HttpManager());
    Get.put(AppUtils());
    Get.put(AuthRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(AuthController(repository: Get.find(), appUtils: Get.find()));
  }
}