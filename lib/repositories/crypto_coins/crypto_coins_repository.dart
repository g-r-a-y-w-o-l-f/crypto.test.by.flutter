
import 'package:a_block/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:a_block/repositories/models/crypto_coin.dart';
import 'package:a_block/repositories/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  Dio dio;
  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,SAG,DOV,AVAX&tsyms=USD'
    );
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;
    final list  = dataRAW.entries.map((entry) {
        final usdData = (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final details= CryptoCoinDetails.fromJson(usdData);
        return CryptoCoin(
            coinName: entry.key,
            coinDetails: details );
    }).toList();
    debugPrint(response.toString());
    return list;
  }

  @override
  Future<CryptoCoinDetails> getCoinDetails(final String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD'
    );
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRAW[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetails.fromJson(usdData);
    return details;
  }

}