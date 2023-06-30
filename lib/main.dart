import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop_app_clean_arch/core/helper/bloc_observer.dart';
import 'package:shop_app_clean_arch/core/network/network_info.dart';
import 'package:shop_app_clean_arch/core/utils/api_service.dart';
import 'package:shop_app_clean_arch/features/product/data/data_source/remote/products_remote_data_source.dart';
import 'package:shop_app_clean_arch/features/product/data/repository/product_repository_imp.dart';
import 'package:shop_app_clean_arch/features/product/domain/use_cases/get_all_products.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:shop_app_clean_arch/features/product/presentation/screens/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              getAllProductsUseCase: GetAllProductsUseCase(
                repository: ProductRepositoryImp(
                  networkInfo: NetworkInfoImp(
                      internetConnectionChecker: InternetConnectionChecker()),
                  remoteDataSource: ProductsRemoteImpWithDio(
                    apiService: ApiService(dio: Dio()),
                  ),
                ),
              ),
            )..add(
                GetAllProductEvent(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Shop App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ProductsPage(),
        ));
  }
}
