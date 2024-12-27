
import 'package:a_block/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:theme/theme.dart';

class BlockApp extends StatefulWidget {
  const BlockApp({super.key});

  @override
  State<BlockApp> createState() => _BlockAppState();
}


class _BlockAppState extends State<BlockApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Block',
      theme: darkThem,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
      // routes: routers,
  );
}}