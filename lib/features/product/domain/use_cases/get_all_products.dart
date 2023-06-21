import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:shop_app_clean_arch/features/product/data/models/product_model.dart';

import '../repository/product_repositiory.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase({required this.repository});
  Future<Either<Failure, List<ProductModel>>> call() async {
    return await repository.getAllProducts();
  }
}
