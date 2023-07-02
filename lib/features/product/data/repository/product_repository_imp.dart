import 'package:shop_app_clean_arch/core/error/exception.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app_clean_arch/features/product/domain/repository/product_repositiory.dart';

class ProductRepositoryImp extends ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        print("************* ProductRepositoryImp START**************** ");
        var remote = await remoteDataSource.getAllProducts();
        print("************* $remote **************** ");

        print("************* ProductRepositoryImp END**************** ");
       return right(remote);
      } on ServerException {
        return left(ServerFailure());
      } catch (e) {
        return left(WrongDataFailure());
      }
    }

    return left(WrongDataFailure());
  }
}
