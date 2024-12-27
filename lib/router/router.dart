
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../features/crypto/coin/screen_crypto_coin.dart';
import '../features/crypto/list/screen_coins_list.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RouteCoinsList.page, path: '/'),
    AutoRoute(page: RouteCryptoCoin.page),
  ];
}