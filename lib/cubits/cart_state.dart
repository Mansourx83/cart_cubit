part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ItemIsAdded extends CartState {
  final String productName;
  final ProductItem productItem;
  ItemIsAdded(this.productName, this.productItem);

}
class ItemIsRemoved extends CartState {
  final String productName;
  final ProductItem productItem;
  ItemIsRemoved(this.productName, this.productItem);

}
