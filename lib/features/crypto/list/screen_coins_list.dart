import 'dart:async';

import 'package:a_block/features/crypto/list/bloc/crypto_list_bloc.dart';
import 'package:a_block/features/widgets/crypto_tile.dart';
import 'package:a_block/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ScreenCoinsList extends StatefulWidget {
  const ScreenCoinsList({super.key});
  @override
  State<ScreenCoinsList> createState() => _ScreenCoinsListState();
}

class _ScreenCoinsListState extends State<ScreenCoinsList> {
  final CryptoListBloc _block = CryptoListBloc(repository: GetIt.I<AbstractCoinsRepository>());
  @override
  void initState() {
    _block.add(CryptoListEventLoading());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto list', textAlign: TextAlign.center),
      ),
      body: RefreshIndicator( onRefresh: () async {
        final compliter = Completer();
        _block.add(CryptoListEventLoading(compliter: compliter));
        return compliter.future;
      },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _block,
        builder: (context, state) {
          if( state is CryptoListSuccess ) {
              final data = state as CryptoListSuccess;
              return ListView.separated(
                itemCount: data.coins.length,
                separatorBuilder: (context, i) => const Divider(),
                itemBuilder: (context, i) =>
                    CryptoTile(
                        coins: data.coins[i]
                    )
            );
          }
          if( state is CryptoListFailure) {
            final error = state as CryptoListFailure;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ups!.. Something when wrong", style: _theme.textTheme.labelMedium),
                  Text('Please try again later...', style: _theme.textTheme.labelSmall),
                  const SizedBox(height: 32),
                  TextButton(
                      onPressed: () {_block.add(CryptoListEventLoading());},
                      child: Text("Try again")
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}