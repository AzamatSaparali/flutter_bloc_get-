part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable{
  const ProductEvent();
}

class ProductLoadingEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}