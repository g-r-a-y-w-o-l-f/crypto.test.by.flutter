// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      priceInUSD: CryptoCoinDetails._doubleFromJson(
          (json['PRICE'] as num).toDouble()),
      imageURL: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetails._dateTimeFromJson(
          (json['LASTUPDATE'] as num).toInt()),
      high24Hour: CryptoCoinDetails._doubleFromJson(
          (json['HIGH24HOUR'] as num).toDouble()),
      low24Hour: CryptoCoinDetails._doubleFromJson(
          (json['LOW24HOUR'] as num).toDouble()),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageURL,
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CryptoCoinDetails._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
    };
