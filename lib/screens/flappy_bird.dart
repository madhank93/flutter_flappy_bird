import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flappy_bird/characters/dash.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector {
  Dash _dash;
  DashLand _theme;

  FlappyBird() {
    _theme = DashLand();
    add(_theme);

    _dash = Dash();
    add(_dash);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dash.jump();
  }
}
