import 'dart:math';

import 'package:Musashi/components/animation.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreenPage extends StatefulWidget {
  const GameScreenPage({super.key});

  @override
  State<GameScreenPage> createState() => _GameScreenPageState();
}

class _GameScreenPageState extends State<GameScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: MusashiGame(),
      ),
    );
  }
}

GestureDetector buildPauseButton() {
  return GestureDetector(
    onTap: () {
      print("pause");
    },
    child: Image.asset(
      'assets/images/buttons/UI_Button_settings.png', // Replace with the actual path
      width: 50, // Adjust the size as needed
      height: 50,
    ),
  );
}

class MusashiGame extends FlameGame with TapCallbacks {
  late SpriteAnimationComponent character;
  List<SpriteAnimationComponent> enemies = [];
  late MusashiCharacter musashi;

  Vector2 targetPosition =
      Vector2.zero(); // Initialize to (0,0) or any starting position
  double moveSpeed = 200.0; // Adjust the move speed as needed

  @override
  Future<void> onLoad() async {
    print("loading assets");
    Flame.device.fullScreen();
    Flame.device.setPortrait();
    // Load the background image
    SpriteComponent background = SpriteComponent()
      ..sprite = await Sprite.load('background_resized.png')
      ..size = size;
    add(background);
    // Create and initialize MusashiCharacter
    musashi = MusashiCharacter(Vector2(
        size.x / 2 - 50, size.y / 2 - 50)); // Assign to the musashi field
    // Wait for characterComponent initialization to complete
    await musashi.initialization;

    // Assign the characterComponent to the character field
    character = musashi.characterComponent;

    // Add the characterComponent to the game
    add(character);

    //------------------------------------------------------------

    YoshiokaEnemy yoshiokaEnemy =
        YoshiokaEnemy(Vector2(100, 200)); // Assign to the musashi field
    // Wait for characterComponent initialization to complete
    await yoshiokaEnemy.initialization;
    enemies.add(yoshiokaEnemy.enemyComponent);
    add(yoshiokaEnemy.enemyComponent);
  }

  SpriteAnimationComponent? isTapOnEnemy(Vector2 tapPosition) {
    // Check if the tap position is within the bounds of the enemy
    for (final enemy in enemies) {
      final enemyPosition = enemy.position;
      final enemySize = enemy.size;

      if (tapPosition.x >= enemyPosition.x &&
          tapPosition.x <= enemyPosition.x + enemySize.x &&
          tapPosition.y >= enemyPosition.y &&
          tapPosition.y <= enemyPosition.y + enemySize.y) {
        return enemy; // Tap is on the enemy
      }
    }
    return null; // Tap is not on the enemy
  }

  @override
  void onTapDown(TapDownEvent event) async {
    /*
    SpriteAnimationComponent? enemy = isTapOnEnemy(event.localPosition);
    if (enemy != null) {
      print("tap on enemy");
      print(enemy.position);
      musashi.moveToEnemy(enemy.position, 1.1);
      enemies.remove(enemy);
      remove(enemy);
    }
    */
    musashi.moveToEnemy(event.localPosition, 1);
  }

  @override
  void update(double deltaTime) {
    // Add game logic here if needed
    super.update(deltaTime);
  }

  @override
  void render(Canvas canvas) {
    // Rendering is handled automatically, including the background
    super.render(canvas);
    // Render the pause button at the top right corner
    final double buttonSize = 40.0; // Adjust the button size as needed
    final double margin = 16.0; // Adjust the margin as needed
    final Offset buttonPosition = Offset(
      size.x - buttonSize - margin,
      margin,
    );

    final pauseButton = buildPauseButton();
  }
}
