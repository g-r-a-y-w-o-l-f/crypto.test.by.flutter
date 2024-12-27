part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListState extends Equatable {}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}
final class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}
final class CryptoListSuccess extends CryptoListState {
  List<CryptoCoin> coins;
  CryptoListSuccess({required this.coins});

  @override
  List<Object?> get props => [coins];
}
final class CryptoListFailure extends CryptoListState {
  Object? exception;
  CryptoListFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}
