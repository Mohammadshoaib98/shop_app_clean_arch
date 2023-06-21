import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:shop_app_clean_arch/features/product/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
