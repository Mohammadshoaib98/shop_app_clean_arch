import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
