// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoin _$CryptoCoinFromJson(Map<String, dynamic> json) => CryptoCoin(
      coinName: json['coinName'] as String,
      coinDetails: CryptoCoinDetails.fromJson(
          json['coinDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoCoinToJson(CryptoCoin instance) =>
    <String, dynamic>{
      'coinName': instance.coinName,
      'coinDetails': instance.coinDetails,
    };
