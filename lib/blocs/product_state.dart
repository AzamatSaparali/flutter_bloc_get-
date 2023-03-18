part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);

  final List<ProductModel> products;

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  ProductErrorState(this.error);

  final String error;

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
