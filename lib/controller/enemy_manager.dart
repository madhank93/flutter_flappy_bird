import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/model/enemy_type.dart';
import 'package:flappy_bird/screens/flappy_bird.dart';

class EnemyManager extends Component with HasGameRef<FlappyBird> {
  Random _random;
  Timer _timer;

  EnemyManager() {
    _random = Random();
    _timer = Timer(
      4,
      repeat: true,
      callback: () {
        spawnRandomEnemy();
      },
    );
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  void spawnRandomEnemy() {
    final randomNumber = _random.nextInt(EnemyType.values.length);
    print(randomNumber);
    final randomEnemyType = EnemyType.values.elementAt(randomNumber);
    final newEnemy = EnemyController(randomEnemyType);
    gameRef.addLater(newEnemy);
  }

  @override
  void render(Canvas canvas) {}

  @override
  void update(double time) {
    _timer.update(time);
  }
}
