import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _primaryColor = Colors.blue;
  static const _secondaryColor = Color(0xFFffffff);
  static const _backgroundColor = Color(0xFFedf2fb);
  static const _headingRowColor = Color(0xFFF5F5F5);
  static final _iconTheme = IconThemeData(color: Colors.grey[600]);
  static const _floatingActionButtonColor = Colors.blue;
  static const _tileColor = Colors.white;

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      iconTheme: _iconTheme,
      inputDecorationTheme: _inputDecorationTheme,
      primaryColor: _primaryColor,
      listTileTheme: _listTileTheme,
      cardColor: _secondaryColor,
      scaffoldBackgroundColor: _backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dataTableTheme: _dataTableTheme,
      textButtonTheme: _textButtonTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
    );
  }

  static const _listTileTheme = ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    dense: true,
    tileColor: _tileColor,
  );

  static const _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: _floatingActionButtonColor,
  );

  static final _textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
  ));

  static final _dataTableTheme = DataTableThemeData(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    dataRowHeight: 40,
    headingRowColor: MaterialStateProperty.all(_headingRowColor),
    headingRowHeight: 40,
    horizontalMargin: 16,
    columnSpacing: 16,
    dividerThickness: 0.2,
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,
    focusColor: Colors.white,
    hoverColor: Colors.white,
    filled: true,
    isDense: true,
    errorStyle: const TextStyle(fontSize: 10),
    hintStyle: const TextStyle(fontSize: 14),
    labelStyle: const TextStyle(fontSize: 14),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.all(12),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
      ),
      borderRadius: BorderRadius.circular(12),
      gapPadding: 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFE30425)),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFE30425)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
