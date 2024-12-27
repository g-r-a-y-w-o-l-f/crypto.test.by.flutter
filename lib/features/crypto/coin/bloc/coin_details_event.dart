part of 'coin_details_bloc.dart';

@immutable
abstract class CoinDetailsBlocEvent extends Equatable {}

class CoinDetailsEventLoading extends CoinDetailsBlocEvent{
  Completer? compliter;
  final String currencyCode;
  CoinDetailsEventLoading({
    this.compliter,
    required this.currencyCode
  });

  @override
  List<Object?> get props => [compliter, currencyCode];
}