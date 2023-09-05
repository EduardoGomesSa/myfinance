import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/api_result.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';
import 'package:myfinance/app/models/bill_model.dart';

class BillRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  BillRepository({
    required this.httpManager,
    required this.appUtils
  });

  Future<ApiResult<List<BillModel>>> getAll() {
    
  }
}