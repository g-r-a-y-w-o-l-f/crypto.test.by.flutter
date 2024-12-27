import 'dart:async';

import 'package:a_block/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:a_block/repositories/crypto_coins/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'init_block_app.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Start Talker...');

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestData: false
      )));

  Bloc.observer = TalkerBlocObserver(talker: talker);

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() =>
      CryptoCoinsRepository(dio: dio)
  );

  FlutterError.onError = (details) => 
      GetIt.I<Talker>().handle(details.exception, details.stack); 
  
  runZonedGuarded(() => {runApp(const BlockApp())},
          (ex, stack ) => {GetIt.I<Talker>().handle(ex, stack)});

  // runApp(const BlockApp());
}




