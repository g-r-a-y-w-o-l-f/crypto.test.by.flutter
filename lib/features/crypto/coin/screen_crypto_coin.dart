import 'package:a_block/features/crypto/coin/bloc/coin_details_bloc.dart';
import 'package:a_block/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:a_block/repositories/models/crypto_coin.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'widgets/base_card.dart';

@RoutePage()
class ScreenCryptoCoin extends StatefulWidget {
  final String currencyCoin;

  const ScreenCryptoCoin({
    super.key,
    required this.currencyCoin
  });

  @override
  State<ScreenCryptoCoin> createState() => _StateScreenCryptoCoin();

}

class _StateScreenCryptoCoin extends State<ScreenCryptoCoin> {

  final _coinDetailsBloc  = CoinDetailsBloc(repository: GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _coinDetailsBloc.add(CoinDetailsEventLoading(currencyCode: widget.currencyCoin));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.currencyCoin ?? '')),
      body: BlocBuilder<CoinDetailsBloc, CoinDetailsBlocState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          if (state is CoinDetailsSuccess) {
            final coin = widget.currencyCoin;
            final coinDetails = state.details;
            return Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [ SizedBox(
                  height: 160,
                  width: 160,
                  child: Image.network(coinDetails.getFullImageUrl()),
                ),
                  const SizedBox(height: 24),
                  Text(
                    widget.currencyCoin,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
          ),
                  const SizedBox(height: 8),
                  BaseCard(child: Center(
                    child: Text('${coinDetails.priceInUSD} \$',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ),
                  BaseCard(
                    child: Column(children: [
                      _DataRow(
                        title: 'Hight 24 Hour',
                        value: '${coinDetails.high24Hour} \$',
                      ),
                      const SizedBox(height: 6),
                      _DataRow(
                        title: 'Low 24 Hour',
                        value: '${coinDetails.low24Hour} \$',
                      ),
                    ],),
                  ),
                ],),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}