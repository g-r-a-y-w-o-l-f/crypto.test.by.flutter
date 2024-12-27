import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@JsonSerializable()
class CryptoCoinDetails extends Equatable {

  @JsonKey(name: 'PRICE')
  final String priceInUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;
  @JsonKey(
      name: 'LASTUPDATE',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson
  )
  final DateTime lastUpdate;
  @JsonKey(name: 'HIGH24HOUR')
  final String high24Hour;
  @JsonKey(name: 'LOW24HOUR')
  final String low24Hour;

  CryptoCoinDetails({
    required this.priceInUSD,
    required this.imageURL,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour
  });

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int millisecond) => DateTime.fromMicrosecondsSinceEpoch(millisecond);

  static String _doubleFromJson(double value) => value.toString();

  String getFullImageUrl() => 'https://cryptocompare.com/$imageURL';

  @override
  List<Object> get props => [
    priceInUSD,
    imageURL,
    toSymbol,
    lastUpdate,
    high24Hour,
    low24Hour,
  ];
}