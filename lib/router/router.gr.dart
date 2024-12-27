// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    RouteCryptoCoin.name: (routeData) {
      final args = routeData.argsAs<RouteCryptoCoinArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenCryptoCoin(
          key: args.key,
          currencyCoin: args.currencyCoin,
        ),
      );
    },
    RouteCoinsList.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCoinsList(),
      );
    },
  };
}

/// generated route for
/// [ScreenCryptoCoin]
class RouteCryptoCoin extends PageRouteInfo<RouteCryptoCoinArgs> {
  RouteCryptoCoin({
    Key? key,
    required String currencyCoin,
    List<PageRouteInfo>? children,
  }) : super(
          RouteCryptoCoin.name,
          args: RouteCryptoCoinArgs(
            key: key,
            currencyCoin: currencyCoin,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteCryptoCoin';

  static const PageInfo<RouteCryptoCoinArgs> page =
      PageInfo<RouteCryptoCoinArgs>(name);
}

class RouteCryptoCoinArgs {
  const RouteCryptoCoinArgs({
    this.key,
    required this.currencyCoin,
  });

  final Key? key;

  final String currencyCoin;

  @override
  String toString() {
    return 'RouteCryptoCoinArgs{key: $key, currencyCoin: $currencyCoin}';
  }
}

/// generated route for
/// [ScreenCoinsList]
class RouteCoinsList extends PageRouteInfo<void> {
  const RouteCoinsList({List<PageRouteInfo>? children})
      : super(
          RouteCoinsList.name,
          initialChildren: children,
        );

  static const String name = 'RouteCoinsList';

  static const PageInfo<void> page = PageInfo<void>(name);
}
