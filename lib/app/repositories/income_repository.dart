import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/income_model.dart';

import '../core/utils/urls.dart';

class IncomeRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  IncomeRepository({
    required this.httpManager,
    required this.appUtils
  });

  Future<ApiResult<List<IncomeModel>>> getAll({required String token}) async {
    const String endpoint = "${Url.base}/incomes";

    final response = await httpManager.request(
      url: endpoint, 
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if(response['data'] != null){
      List list = response['data'];

      List<IncomeModel> incomeList = IncomeModel.fromList(list);

      return ApiResult<List<IncomeModel>>(data: incomeList);
    } else {
      String message = response['error'] ?? "Não foi possível buscas os ganhos. Tente novamente!";

      return ApiResult<List<IncomeModel>>(message: message, isError: true);
    }
  }
}