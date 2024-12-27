part of 'coin_details_bloc.dart';

@immutable
abstract class CoinDetailsBlocState extends Equatable {}

final class CoinDetailsInitial extends CoinDetailsBlocState {
  @override
  List<Object?> get props => [];
}

final class CoinDetailsLoading extends CoinDetailsBlocState {
  @override
  List<Object?> get props => [];
}

final class CoinDetailsSuccess extends CoinDetailsBlocState {
  CryptoCoinDetails details;
  CoinDetailsSuccess({required this.details});
  @override
  List<Object?> get props => [details];
}

final class CoinDetailsFailure extends CoinDetailsBlocState {
  Object? extantion;
  CoinDetailsFailure({required this.extantion});

  @override
  List<Object?> get props => [extantion];
}

