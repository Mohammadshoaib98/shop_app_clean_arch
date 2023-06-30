import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:shop_app_clean_arch/core/use_case/use_case.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';
import '../repository/product_repositiory.dart';

class GetAllProductsUseCase extends UseCase<List<ProductEntity>, NoParam> {
  final ProductRepository repository;

  GetAllProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call([NoParam? param]) async {
    return await repository.getAllProducts();
  }
}


class NoParam {}
