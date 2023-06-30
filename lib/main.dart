import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_arch/core/helper/bloc_observer.dart';
import 'package:shop_app_clean_arch/features/product/domain/use_cases/get_all_products.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:shop_app_clean_arch/features/product/presentation/screens/products_screen.dart';
import 'package:shop_app_clean_arch/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
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
            getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
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
