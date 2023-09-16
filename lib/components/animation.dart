import 'package:flame/components.dart';
import 'package:flame/events.dart';

class MusashiCharacter extends SpriteAnimationComponent with TapCallbacks {
  late SpriteAnimationComponent characterComponent;
  late Future<void> initialization; // Future to track initialization

  MusashiCharacter(Vector2 position) {
    initialization =
        _initCharacter(position); // Initialize and track the future
  }

  Future<void> _initCharacter(Vector2 position) async {
    try {
      // Load animation frames for Musashi
      final List<Sprite> animationFrames = await initStandingAnimation();

      // Create a SpriteAnimation from the loaded frames
      final animation = SpriteAnimation.spriteList(
        animationFrames,
        stepTime: 0.4, // Adjust the duration for your desired animation speed
        loop: true, // Set to true for a looping animation
      );

      // Create a SpriteAnimationComponent for Musashi
      characterComponent = SpriteAnimationComponent(
        animation: animation,
        position: position,
        size: Vector2(30, 30),
      );
    } catch (e) {
      print("error loading Musashi animation: $e");
    }
  }

  Future<List<Sprite>> initStandingAnimation() async {
    // Load animation frames for Musashi
    final List<Sprite> animationFrames = [
      await Sprite.load('musashi/standing/frame1.png'),
      await Sprite.load('musashi/standing/frame2.png'),
      // Load frames here using Sprite.load for Musashi
    ];
    return animationFrames;
  }

  Future<List<Sprite>> initDashAnimation() async {
    // Load animation frames for Musashi
    final List<Sprite> animationFrames = [
      await Sprite.load('musashi/dash/frame1.png'),
      await Sprite.load('musashi/dash/frame2.png'),
      // Load frames here using Sprite.load for Musashi
    ];
    return animationFrames;
  }

  Future<List<Sprite>> initAttackAnimation() async {
    // Load animation frames for Musashi
    final List<Sprite> animationFrames = [
      await Sprite.load('musashi/attack/frame1.png'),
      await Sprite.load('musashi/attack/frame2.png'),
      await Sprite.load('musashi/attack/frame3.png'),
      await Sprite.load('musashi/attack/frame4.png'),
      await Sprite.load('musashi/attack/frame5.png'),
      await Sprite.load('musashi/attack/frame6.png'),
      await Sprite.load('musashi/attack/frame7.png'),
      await Sprite.load('musashi/attack/frame8.png'),
      await Sprite.load('musashi/attack/frame9.png'),
      await Sprite.load('musashi/attack/frame10.png'),
      await Sprite.load('musashi/attack/frame11.png'),
      // Load frames here using Sprite.load for Musashi
    ];
    return animationFrames;
  }

  void moveToEnemy(Vector2 enemyPosition, double moveSpeed) async {
    // Calculate the vector from the character's current position to the enemy's position
    final directionVector = enemyPosition - characterComponent.position;

    // Load animation frames for Musashi

    // Set the character's animation to "dash" and play it
    characterComponent.animation = SpriteAnimation.spriteList(
      await initDashAnimation(),
      stepTime: 0.4, // Adjust the duration for your desired animation speed
      loop: true, // Set to true for a looping animation
    );
    characterComponent.playing = true;

    // Calculate the movement delta based on the direction vector and moveSpeed
    final movementDelta = directionVector.normalized() * moveSpeed;

    // Move the character toward the enemy's position with the adjusted speed
    characterComponent.position += movementDelta;

    // Calculate the new position for the center of the character
    final newCenterPosition = enemyPosition;

    // Adjust the character's position to be at the new center position
    characterComponent.position =
        newCenterPosition - characterComponent.size / 2;
    initStandingAnimation();
    characterComponent.playing = true;
  }
}

class YoshiokaEnemy {
  late SpriteAnimationComponent enemyComponent;
  late Future<void> initialization; // Future to track initialization

  YoshiokaEnemy(Vector2 position) {
    initialization = _initEnemy(position); // Initialize and track the future
  }

  Future<void> _initEnemy(Vector2 position) async {
    try {
      // Load animation frames for Yoshioka
      final List<Sprite> animationFrames = [
        await Sprite.load('yoshioka/standing/frame1.png'),
        await Sprite.load('yoshioka/standing/frame2.png'),
        // Load frames here using Sprite.load for Yoshioka
      ];

      // Create a SpriteAnimation from the loaded frames
      final animation = SpriteAnimation.spriteList(
        animationFrames,
        stepTime: 0.4, // Adjust the duration for your desired animation speed
        loop: true, // Set to true for a looping animation
      );

      // Create a SpriteAnimationComponent for Yoshioka
      enemyComponent = SpriteAnimationComponent(
        animation: animation,
        position: position,
        size: Vector2(30, 30),
      );
    } catch (e) {
      print("error loading Yoshioka animation: $e");
    }
  }
}
