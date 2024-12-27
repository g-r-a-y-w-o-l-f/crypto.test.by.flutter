import 'dart:async';
import 'package:a_block/repositories/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../repositories/crypto_coins/abstract_coins_repository.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsBlocEvent, CoinDetailsBlocState> {
  CoinDetailsBloc({required this.repository}) : super(CoinDetailsInitial()) {
    on<CoinDetailsEventLoading>(_load);
  }

  final AbstractCoinsRepository repository;

  Future<void> _load(
      CoinDetailsEventLoading event,
      Emitter<CoinDetailsBlocState> emit) async {
    try {
      if (state is! CoinDetailsSuccess) {
        emit(CoinDetailsLoading());
      }

      final coinDetails =
      await repository.getCoinDetails(event.currencyCode);
      emit(CoinDetailsSuccess(details: coinDetails));
    } catch (e, st) {
      emit(CoinDetailsFailure(extantion: e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

}
