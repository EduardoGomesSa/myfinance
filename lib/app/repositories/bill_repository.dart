import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/core/utils/urls.dart';
import 'package:myfinance/app/models/bill_model.dart';

class BillRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  BillRepository({
    required this.httpManager,
    required this.appUtils
  });

  Future<ApiResult<List<BillModel>>> getAll({required String token}) async {
    const String endpoint = "${Url.base}/bills";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if(response['data'] != null){
      List list = response['data'];

      List<BillModel> billList = BillModel.fromList(list);

      return ApiResult<List<BillModel>>(data: billList);
    } else {
      String message = response['error'] ?? "Não foi possível buscar as contas. Tente novamente!";

      return ApiResult<List<BillModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<BillModel>> insert({required String token, required BillModel bill}) async{
    const String endpoint = "${Url.base}/bills";

    Map<String, dynamic> body = bill.toMap();

    final response = await httpManager.request(
      url: endpoint, 
      method: HttpMethods.post,
      body: body,
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if(response['data'] != null){
      BillModel billModel = BillModel.fromMap(response['data']);

      return ApiResult<BillModel>(data: billModel);
    } else {
      String message = response['error'] ?? 'Não foi possível salvar a conta. Tente novamente!';

      return ApiResult<BillModel>(message: message, isError: true);
    }
  }
}