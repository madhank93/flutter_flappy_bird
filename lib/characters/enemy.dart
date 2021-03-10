import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flappy_bird/constant/constants.dart';

class Enemy extends AnimationComponent {
  Enemy() : super.empty() {
    final spriteSheet = SpriteSheet(
      imageName: kEnemyImage,
      textureWidth: 64,
      textureHeight: 64,
      columns: 2, // refers to image
      rows: 1, // refers to image
    );

    this.animation = spriteSheet.createAnimation(0, stepTime: .1);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    this.width = this.height = kEnemySize;

    this.x = size.width / 2 + 40;
    this.y = size.height / 2 - 40;
  }

  @override
  void update(double time) {
    super.update(time);
  }
}
