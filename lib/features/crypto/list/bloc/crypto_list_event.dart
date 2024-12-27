part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListEvent extends Equatable {}

class CryptoListEventLoading extends CryptoListEvent{
  Completer? compliter;
  CryptoListEventLoading({this.compliter});

  @override
  List<Object?> get props => [compliter];
}
// class CryptoListSuccess extends CryptoListEvent{}
// class CryptoListFailure extends CryptoListEvent{}
// class CryptoListNothing extends CryptoListEvent{}