import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_arch/core/helper/bloc_observer.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:shop_app_clean_arch/features/product/presentation/screens/products_screen.dart';
import 'service_locator.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    
  Bloc.observer = MyBlocObserver();
  await setup();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ProductBloc>()..add(GetAllProductEvent())
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
