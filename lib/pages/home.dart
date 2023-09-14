import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fond du jeu (obscurci)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black
                  .withOpacity(0.8), // Opacité pour obscurcir le fond
            ),
          ),
          // Boutons "Settings" et "Play"
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Musashi',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    fontFamily:
                        'PressStart2P', // Replace with your chosen font family name
                    fontSize: 50, // Adjust the font size as needed
                    color: Colors.white, // Adjust the font color as needed
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 100), // Espacement entre le titre et les boutons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Settings");
                    },
                    child: Image.asset(
                      'assets/images/buttons/UI_Button_settings.png', // Replace with the actual path
                      width: 50, // Adjust the size as needed
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 20), // Espacement entre les boutons
                  GestureDetector(
                    onTap: () {
                      print("Play");
                    },
                    child: Image.asset(
                      'assets/images/buttons/UI_Button_play.png', // Replace with the actual path
                      width: 50, // Adjust the size as needed
                      height: 50,
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
