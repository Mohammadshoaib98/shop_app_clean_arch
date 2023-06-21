import 'package:shop_app_clean_arch/core/error/exception.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/features/product/data/models/product_model.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/features/product/domain/repository/product_repositiory.dart';

class ProductRepositoryImp extends ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImp({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.getAllProducts();

        Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {}
    throw UnimplementedError();
  }

}
