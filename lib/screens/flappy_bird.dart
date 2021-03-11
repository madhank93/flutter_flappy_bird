import 'package:flame/components/text_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flappy_bird/controller/dash_controller.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/model/enemy_type.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector {
  DashController _dash;
  DashLand _theme;
  EnemyController _enemy;
  TextComponent _scoreTextComponent;
  int _score;

  FlappyBird() {
    _theme = DashLand();
    add(_theme);

    _score = 0;
    _scoreTextComponent = TextComponent(_score.toString());
    add(_scoreTextComponent);

    _dash = DashController();
    add(_dash);

    _enemy = EnemyController(EnemyType.Helicopter);
    add(_enemy);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dash.jump();
  }

  void update(double time) {
    super.update(time);
    _score += (60 * time).toInt();
    _scoreTextComponent.text = _score.toString();
  }

  void resize(Size size) {
    super.resize(size);
    _scoreTextComponent.setByPosition(
      Position((size.width / 2 - _scoreTextComponent.width / 2), 0),
    );
  }
}
