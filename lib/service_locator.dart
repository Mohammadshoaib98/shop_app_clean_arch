import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/core/utils/api_service.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/features/product/data/repository/product_repository_imp.dart';
import 'package:shop_app_clean_arch/features/product/domain/use_cases/get_all_products.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  final sharedPreference = await SharedPreferences.getInstance();

  //! Feature Products

//Blocs
  sl.registerFactory<ProductBloc>(
      () => ProductBloc(getAllProductsUseCase: sl()));
//UseCases
  sl.registerFactory<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(repository: sl()));
//Repository
  sl.registerLazySingleton<ProductRepositoryImp>(
      () => ProductRepositoryImp(networkInfo: sl(), remoteDataSource: sl()));
//DataSource

  sl.registerLazySingleton<ProductsRemoteImpWithDio>(
      () => ProductsRemoteImpWithDio(apiService: sl()));
//Core
  sl.registerLazySingleton<NetworkInfoImp>(
      () => NetworkInfoImp(internetConnectionChecker: sl()));

  sl.registerLazySingleton<ApiService>(() => ApiService(dio: sl()));

//External

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
