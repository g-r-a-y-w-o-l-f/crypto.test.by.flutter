
import 'package:a_block/repositories/models/crypto_coin.dart';
import 'package:a_block/repositories/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetails> getCoinDetails(final String currencyCode);
}