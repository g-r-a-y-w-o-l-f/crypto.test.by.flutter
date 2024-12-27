
import 'package:flutter/material.dart';

final darkThem = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
    primarySwatch: Colors.cyan,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(26, 26, 26, 1.0)),
    dividerTheme: const DividerThemeData(color: Color.fromRGBO(
        49, 0, 0, 1.0)),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(225, 178, 178, 1.0)),
        backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
        titleTextStyle: TextStyle(
            color: Color.fromRGBO(225, 178, 178, 1.0),
            fontSize: 24,
            fontWeight: FontWeight.w700 )
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            color: Color.fromARGB(100, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600),
        bodyMedium:  TextStyle(
            color: Color.fromARGB(100, 195, 255, 249),
            fontSize: 16,
            fontWeight: FontWeight.w400
        )
    )
);