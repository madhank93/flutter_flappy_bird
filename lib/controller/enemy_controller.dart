import 'dart:math';
import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flappy_bird/model/enemy.dart';
import 'package:flappy_bird/model/enemy_type.dart';
import 'package:flappy_bird/constant/game_constants.dart';

class EnemyController extends AnimationComponent {
  Size size;
  Enemy _data;

  static const Map<EnemyType, Enemy> _enemyDetails = {
    EnemyType.Corona: Enemy(
      imageName: kCoronaEnemyImage,
      textureWidth: 64,
      textureHeight: 64,
      columns: 2,
      rows: 1,
      speed: 200,
    ),
    EnemyType.Helicopter: Enemy(
      imageName: kHelicopterEnemyImage,
      textureWidth: 228,
      textureHeight: 228,
      columns: 2,
      rows: 1,
      speed: 300,
    ),
  };

  EnemyController(EnemyType enemyType) : super.empty() {
    _data = _enemyDetails[enemyType];

    final spriteSheet = SpriteSheet(
      imageName: _data.imageName,
      textureWidth: _data.textureWidth,
      textureHeight: _data.textureHeight,
      columns: _data.columns, // refers to image
      rows: _data.rows, // refers to image
    );

    this.animation = spriteSheet.createAnimation(0, stepTime: .1);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.size = size;

    this.width = this.height = kCoronaEnemySize;

    this.x = size.width;
    this.y = (size.height / 4) +
        Random().nextInt(size.height.toInt() - (size.height ~/ 4));
    print(this.y);
  }

  @override
  void update(double time) {
    super.update(time);
    this.x -= _data.speed * time;
  }

  @override
  bool destroy() {
    return (this.x < -(this.width));
  }
}
