import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/model/enemy_type.dart';
import 'package:flappy_bird/screens/flappy_bird_game_controller.dart';

class EnemyManager extends Component with HasGameRef<FlappyBird> {
  Random _random;
  Timer _timer;
  int _spawnLevel;

  EnemyManager() {
    _random = Random();
    _spawnLevel = 0;
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
    final randomEnemyType = EnemyType.values.elementAt(randomNumber);
    final newEnemy = EnemyController(randomEnemyType);
    gameRef.addLater(newEnemy);
  }

  @override
  void render(Canvas canvas) {}

  @override
  void update(double time) {
    _timer.update(time);

    var newSpawnLevel = gameRef.score ~/ 500;

    if (_spawnLevel < newSpawnLevel) {
      _spawnLevel = newSpawnLevel;
      _timer.stop();

      double newWaitTimer = (4 / (1 + (0.1 * _spawnLevel)));

      _timer = Timer(
        newWaitTimer,
        repeat: true,
        callback: () {
          spawnRandomEnemy();
        },
      );
      _timer.start();
    }
  }

  void resetGame() {
    _spawnLevel = 0;
    _timer = Timer(
      4,
      repeat: true,
      callback: () {
        spawnRandomEnemy();
      },
    );
    _timer.start();
  }
}
