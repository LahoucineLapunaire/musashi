import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musashi/musashi.dart';
import 'package:musashi/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Flame.device.fullScreen();
  //Flame.device.setPortrait();
  //Musashi game = Musashi();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "Musashi", home: HomePage()));
}
