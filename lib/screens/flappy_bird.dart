import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flappy_bird/controller/dash_controller.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/model/enemy_type.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector {
  DashController _dash;
  DashLand _theme;
  EnemyController _enemy;

  FlappyBird() {
    _theme = DashLand();
    add(_theme);

    _dash = DashController();
    add(_dash);

    _enemy = EnemyController(EnemyType.Corona);
    add(_enemy);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dash.jump();
  }
}
