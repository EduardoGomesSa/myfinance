import 'package:myfinance/app/core/services/http_manager.dart';
import 'package:myfinance/app/core/utils/app_utils.dart';

class AuthRepository{
  final HttpManager httpManager;
  final AppUtils appUtils;

  AuthRepository({
    required this.httpManager,
    required this.appUtils
  });
}