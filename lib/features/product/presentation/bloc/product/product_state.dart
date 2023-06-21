part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<ProductModel> products;
  const LoadedProductState({required this.products});
  @override
  List<Object> get props => [products];
}

class ErrorProductsState extends ProductState {
  final String message;

  const ErrorProductsState({required this.message});
  @override
  List<Object> get props => [message];
}
