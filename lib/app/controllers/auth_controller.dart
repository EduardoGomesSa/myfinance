import 'package:get/get.dart';
import 'package:myfinance/app/models/user_model.dart';

class AuthController extends GetxController{
  RxBool isLoading = false.obs;
  UserModel user = UserModel();

  // @override
  // void onInit(){
  //   super.onInit();


  // }

  Future signUp() async {
    isLoading.value = true;

    
  }
}