part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<Item> cartItem;

  const CartLoaded({this.cartItem});

  int get quantity => 
    cartItem.fold(0, (total, current) => total + current.quantity);

  @override
  List<Object> get props => [cartItem];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
