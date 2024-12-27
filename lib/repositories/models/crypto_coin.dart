import 'package:a_block/repositories/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@JsonSerializable()
class CryptoCoin extends Equatable {
  final String coinName;
  final CryptoCoinDetails coinDetails;

  CryptoCoin({
    required this.coinName,
    required this.coinDetails
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) => _$CryptoCoinFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoCoinToJson(this);

  @override
  List<Object> get props => [coinName, coinDetails];
}