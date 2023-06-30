import 'package:dio/dio.dart';
import 'package:shop_app_clean_arch/core/utils/constants.dart';

class ApiService {
  final Dio dio;
  final baseUrl = Constants.baseUrl;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get() async {
    var response = await dio.get('https://student.valuxapps.com/api/home',
        options: Options( headers: {
          'Authorization':
              '2GONLntbNpw8zbCQXuhtR1xpqYIMpWZ6yMaDyTkRh8eEd5mlpZ1FNYUtLcP1tD7hVHO2TE',
          'lang': "en"
        }));

        print('*****************RESPONSE $response **********************');

    return response.data;
  }
}
