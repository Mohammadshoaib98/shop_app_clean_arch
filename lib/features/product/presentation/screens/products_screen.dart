import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_arch/core/widgets/Loading/laoding_widget.dart';
import 'package:shop_app_clean_arch/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:shop_app_clean_arch/features/product/presentation/widgets/list_products_widget.dart';
import 'package:shop_app_clean_arch/features/product/presentation/widgets/message_display_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text('Products'),
      );
  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: ((context, state) {
            if (state is LoadingProductState) {
              return const LoadingWidget();
            } else if (state is LoadedProductState) {
              return ListProductsWidget(products: state.products);
            } else if (state is ErrorProductsState) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          }),
        ),
      );
}
