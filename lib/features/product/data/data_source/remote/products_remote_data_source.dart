import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app_clean_arch/core/utils/constants.dart';
import 'package:shop_app_clean_arch/features/product/data/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

String apiUrl = Constants.baseUrl;

class ProductsRemoteImpWithDio implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteImpWithDio({required this.dio});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get(
      '$apiUrl${Constants.products}',
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.data) as List;
      final List<ProductModel> productList = decodedJson
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      if (kDebugMode) {
        print(productList);
      }
      return productList;
    }
    return [];
  }
}
