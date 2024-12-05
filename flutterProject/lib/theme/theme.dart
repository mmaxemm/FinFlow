import 'package:flutter/material.dart';

final lightTheme = ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 94, 165, 97),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 235, 235, 235),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color:  Color.fromARGB(255, 235, 235, 235),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color.fromARGB(255, 235, 235, 235),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 36, 36, 36),
            fontSize: 20,
            fontWeight: FontWeight.normal
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 94, 165, 97))
          ),
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 94, 165, 97)),
        ),
      );