import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/core/utils/urls.dart';
import 'package:myfinance/app/models/expense_model.dart';

class ExpenseRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  ExpenseRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<List<ExpenseModel>>> getAll({required String token}) async{
    const String endpoint = "${Url.base}/expenses";

    final response = await httpManager.request(
      url: endpoint, 
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if(response['data'] != null){
      List list = response['data'];

      List<ExpenseModel> expenseList = ExpenseModel.fromList(list);

      return ApiResult<List<ExpenseModel>>(data: expenseList);
    } else {
      String message = response['error'] ?? "Não foi possível buscar os gastos. Tente novamente";

      return ApiResult<List<ExpenseModel>>(message: message, isError: true);
    }
  }
}