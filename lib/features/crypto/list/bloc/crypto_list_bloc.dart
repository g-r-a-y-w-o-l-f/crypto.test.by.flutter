import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:a_block/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:a_block/repositories/models/crypto_coin.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc({required this.repository}) : super(CryptoListInitial()) {
    on<CryptoListEventLoading>((event, emit) async {
      try {
        if( state is!  CryptoListSuccess) {
          emit(CryptoListLoading());
        }
        final response = await repository.getCoinsList();
        emit(CryptoListSuccess(coins: response));
      } catch (ex, stack) {
        emit(CryptoListFailure(ex));
        GetIt.I<Talker>().handle(ex, stack);
      } finally {
        event.compliter?.complete();
      }
    });
  }
  final AbstractCoinsRepository repository;
}
