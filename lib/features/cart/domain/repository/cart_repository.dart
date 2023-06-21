import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, bool>> addItemToCart(int id);
}
