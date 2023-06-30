import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';
import 'package:shop_app_clean_arch/core/strings/failure.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app_clean_arch/features/product/domain/use_cases/get_all_products.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  ProductBloc({required this.getAllProductsUseCase}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllProductEvent) {
        emit(LoadingProductState());
        final products = await getAllProductsUseCase.call();
        products.fold((failure) {
          emit(ErrorProductsState(message: _mapFailureToMessage(failure)));
        }, (products) {
          emit(LoadedProductState(products: products));
        });
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
