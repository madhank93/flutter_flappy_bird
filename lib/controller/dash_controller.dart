import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';
import 'package:flappy_bird/constant/game_constants.dart';
import 'package:flutter/foundation.dart';

class DashController extends AnimationComponent {
  Animation _flyAnimation;
  Animation _hitAnimation;
  double _minimumHeight = -20;
  double _maximumHeight = 0.0;
  Timer _hitAnimationTimer;
  bool _isHit;
  ValueNotifier<int> life;
  int topOrBottomTouchCount = 0;

  DashController() : super.empty() {
    _isHit = false;
    life = ValueNotifier(3);

    this.anchor = Anchor.center;

    _hitAnimationTimer = Timer(
      2,
      callback: () {
        flyAnimation();
      },
    );

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

    this.x = size.width / 2;
    this.y = size.height / 2;
  }

  void flyAnimation() {
    _isHit = false;
    this.animation = _flyAnimation;
  }

  void hitAnimation() {
    if (!_isHit) {
      this.animation = _hitAnimation;
      life.value -= 1;
      _hitAnimationTimer.start();
      _isHit = true;
    }
  }

  @override
  void update(double time) {
    super.update(time);
    if (isFlying()) {
      this.y = this.y + 1.5;
    } else {
      ++topOrBottomTouchCount;
    }

    if (topOrBottomTouchCount > 1) {
      life.value = 0;
    }
    _hitAnimationTimer.update(time);
  }

  void jump() {
    this.y = this.y - 25;
  }

  bool isFlying() {
    return (this.y >= _maximumHeight && this.y <= _minimumHeight);
  }
}
