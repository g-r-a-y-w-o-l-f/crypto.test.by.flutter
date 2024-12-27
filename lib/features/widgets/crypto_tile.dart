import 'package:a_block/repositories/models/crypto_coin.dart';
import 'package:a_block/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CryptoTile extends StatelessWidget {
  final CryptoCoin coins;

  const CryptoTile({
    super.key,
    required this.coins});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      minVerticalPadding: 0,
      leading: Image.network('https://cryptocompare.com/${coins.coinDetails.imageURL}', height: 25, width: 25),
      title: Text(coins.coinName, style: theme.textTheme.titleMedium),
      subtitle: Text(coins.coinDetails.priceInUSD.toString(), style: theme.textTheme.bodyMedium),
      trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(225, 178, 178, 1.0)),
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenCryptoCoin()));
        // Navigator.of(context).pushNamed('/coin', arguments: coins.coinName);
        AutoRouter.of(context).push(RouteCryptoCoin(currencyCoin: coins.coinName));
      },
    );
  }

}