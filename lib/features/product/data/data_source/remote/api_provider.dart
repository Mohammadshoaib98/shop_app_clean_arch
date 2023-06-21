import 'package:dio/dio.dart';
import 'package:shop_app_clean_arch/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String apiUrl = Constants.baseUrl;

  Future<dynamic> getAllProducts(productName) async {
    var response = await _dio.get(
      "${Constants.baseUrl}''",
      queryParameters: {'product': productName, 'appid': apiUrl},
    );
    print(response.data);
    return response;
  }
}
