import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isMuted = false;

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
              SizedBox(height: 100), // Espacement entre le titre et les boutons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Info");
                    },
                    child: Image.asset(
                      'assets/images/buttons/UI_Button_info.png', // Replace with the actual path
                      width: 50, // Adjust the size as needed
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 20), // Espacement entre les boutons
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMuted = !_isMuted;
                      });
                      print("Volume");
                    },
                    child: Image.asset(
                      _isMuted
                          ? 'assets/images/buttons/UI_Button_volume_off.png'
                          : 'assets/images/buttons/UI_Button_volume_on.png', // Replace with the actual path
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
