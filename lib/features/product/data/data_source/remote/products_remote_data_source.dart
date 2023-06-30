import 'package:shop_app_clean_arch/core/utils/api_service.dart';
import 'package:shop_app_clean_arch/features/product/data/models/product_model.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts();
}

class ProductsRemoteImpWithDio implements ProductsRemoteDataSource {
  final ApiService apiService;

  ProductsRemoteImpWithDio({required this.apiService});

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    var data = await apiService.get();
    print('************** ProductsRemoteImpWithDio START ********************');
    print(data);

    
    List<ProductEntity> products = [];

    for (var productMap in data['data']['products']) {
      products.add(ProductModel.fromJson(productMap));
    }
        print('************** ProductsRemoteImpWithDio END ********************');

    return products;
  }
}
