import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/user_model.dart';

import '../core/utils/Urls.dart';

class AuthRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  AuthRepository({
    required this.httpManager,
    required this.appUtils
  });

  Future<ApiResult<UserModel>> signIn({required String email, required String password}) async {
    const String endpoint = "${Url.base}/login";

    final response = await httpManager.request(
      url: endpoint, 
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      }
    );

    if(response["data"] != null){
      UserModel user = UserModel.fromMap(response['data']);
      appUtils.saveLocalData(key: "user-token", data: user.token!);

      return ApiResult<UserModel>(data: user);
    }else{
      String message = response['error'] ?? "Não foi possivel fazer login. Tente novamente";
      return ApiResult<UserModel>(message: message, isError: true);
    }
  }
}