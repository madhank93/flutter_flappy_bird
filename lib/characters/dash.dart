import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';

class Dash extends AnimationComponent {
  Animation _flyAnimation;
  Animation _hitAnimation;

  Dash() : super.empty() {
    final spriteSheet = SpriteSheet(
      imageName: "dash-sprite.png",
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

    this.width = this.height = 80;

    this.x = size.height / 5;
    this.y = size.width / 1.5;
  }

  void flyAnimation() {
    this.animation = _flyAnimation;
  }

  void hitAnimation() {
    this.animation = _hitAnimation;
  }
}
