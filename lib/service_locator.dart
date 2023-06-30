import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/core/utils/api_service.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/features/product/data/repository/product_repository_imp.dart';
import 'package:shop_app_clean_arch/features/product/domain/use_cases/get_all_products.dart';
final getIt = GetIt.instance;

void setupDependencies() {
  // Register the BlocObserver

  // Register the InternetConnectionChecker
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  // Register the ApiService
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt<Dio>()));

  // Register the ProductsRemoteImpWithDio
  getIt.registerLazySingleton<ProductsRemoteImpWithDio>(() => ProductsRemoteImpWithDio(apiService: getIt<ApiService>()));

  // Register the NetworkInfoImp
  getIt.registerLazySingleton<NetworkInfoImp>(() => NetworkInfoImp(internetConnectionChecker: getIt<InternetConnectionChecker>()));

  // Register the ProductRepositoryImp
  getIt.registerLazySingleton<ProductRepositoryImp>(() => ProductRepositoryImp(
    networkInfo: getIt<NetworkInfoImp>(),
    remoteDataSource: getIt<ProductsRemoteImpWithDio>(),
  ));

  // Register the GetAllProductsUseCase
  getIt.registerLazySingleton<GetAllProductsUseCase>(() => GetAllProductsUseCase(repository: getIt<ProductRepositoryImp>()));
}