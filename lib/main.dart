import 'package:flutter/material.dart';
import 'package:jokenpo/game.dart';
//import 'package:jokenpo/inicio.dart';

void main() {
  runApp(const MaterialApp(
    themeMode: ThemeMode.dark,
    home: Game(),
    debugShowCheckedModeBanner: false,
  ));
}
