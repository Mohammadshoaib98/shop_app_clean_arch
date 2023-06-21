import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/features/product/data/repository/product_repository_imp.dart';
import 'package:shop_app_clean_arch/features/product/domain/repository/product_repositiory.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Feature Products

//Blocs
  sl.registerFactory(() => ProductBloc(getAllProductsUseCase: sl()));
//UseCases

//Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImp(networkInfo: sl(), remoteDataSource: sl()));
//DataSource
  sl.registerLazySingleton(() => ProductsRemoteImpWithDio(dio: sl()));
//Core
  sl.registerLazySingleton(
      () => NetworkInfoImp(internetConnectionChecker: sl()));
//External
  final sharedPreference = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
