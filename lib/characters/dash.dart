import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flappy_bird/constant/constants.dart';

class Dash extends AnimationComponent {
  Animation _flyAnimation;
  Animation _hitAnimation;
  double _minimumHeight = -60;
  double _maximumHeight = 0.0;

  Dash() : super.empty() {
    final spriteSheet = SpriteSheet(
      imageName: kDashImage,
      textureWidth: 600,
      textureHeight: 600,
      columns: 3, // refers to image
      rows: 1, // refers to image
    );

    _flyAnimation =
        spriteSheet.createAnimation(0, from: 0, to: 2, stepTime: .1);

    _hitAnimation =
        spriteSheet.createAnimation(0, from: 1, to: 3, stepTime: .1);

    this.animation = _flyAnimation;
  }

  @override
  void resize(Size size) {
    super.resize(size);

    this.width = this.height = kDashSize;
    _minimumHeight = _minimumHeight + size.height;

    this.x = size.width / 2 - 40;
    this.y = size.height / 2 - 40;
  }

  void flyAnimation() {
    this.animation = _flyAnimation;
  }

  void hitAnimation() {
    this.animation = _hitAnimation;
  }

  @override
  void update(double time) {
    super.update(time);
    if (isFlying()) {
      this.y = this.y + 1.5;
    }
  }

  void jump() {
    this.y = this.y - 25;
  }

  bool isFlying() {
    return (this.y >= _maximumHeight && this.y <= _minimumHeight);
  }
}
