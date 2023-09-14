import 'package:flame/camera.dart';
import 'package:flame/components.dart';
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
        game: Musashi(),
      ),
    );
  }
}

class Musashi extends FlameGame {
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
    createAnimation("yoshioka", "standing");
  }

  void createAnimation(
    String character,
    String animationType,
  ) async {
    try {
      // Load animation frames (replace with your frame loading logic)
      final List<Sprite> animationFrames = [
        await Sprite.load(character + '/' + animationType + '/frame1.png'),
        await Sprite.load(character + '/' + animationType + '/frame2.png'),
        // Load frames here using Sprite.load
        // For example: await Sprite.load('frame1.png'),
        // Add all frames to this list
      ];

      // Create a SpriteAnimation from the loaded frames
      final animation = SpriteAnimation.spriteList(
        animationFrames,
        stepTime: 0.4, // Adjust the duration for your desired animation speed
        loop: true, // Set to true for a looping animation
      );

      double x = size.x / 2 - 50;
      double y = size.y / 2 - 50;

      // Create a SpriteAnimationComponent to display the animation
      final animationComponent = SpriteAnimationComponent(
        animation: animation,
        position: Vector2(x, y),
        size: Vector2(100, 100),
      );
      add(animationComponent);
    } catch (e) {
      print("error loading animation : $e");
    }
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
  }
}
