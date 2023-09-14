import 'package:flutter/material.dart';
import 'package:Musashi/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Flame.device.fullScreen();
  //Flame.device.setPortrait();
  //Musashi game = Musashi();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "Musashi", home: HomePage()));
}
