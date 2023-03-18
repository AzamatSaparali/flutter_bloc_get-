import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_get/models/product_model.dart';
import 'package:flutter_bloc_get/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductLoadingState()) {
    on<ProductLoadingEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await productRepository.getProducts();
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
