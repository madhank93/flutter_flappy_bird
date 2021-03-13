import 'package:flame/components/text_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flappy_bird/constant/game_constants.dart';
import 'package:flappy_bird/controller/dash_controller.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/controller/enemy_manager.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector {
  DashController _dash;
  DashLand _theme;
  EnemyManager _enemyManager;
  TextComponent _scoreTextComponent;
  int score;

  FlappyBird() {
    _theme = DashLand();
    add(_theme);

    score = 0;
    _scoreTextComponent = TextComponent(
      score.toString(),
      config: TextConfig(
        fontFamily: "AudioWide",
        fontSize: 24.0,
        textAlign: TextAlign.center,
        color: Colors.white,
      ),
    );
    add(_scoreTextComponent);

    _dash = DashController();
    add(_dash);

    _enemyManager = EnemyManager();
    add(_enemyManager);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dash.jump();
  }

  @override
  void update(double time) {
    super.update(time);
    score += (60 * time).toInt();
    _scoreTextComponent.text = score.toString();

    components.whereType<EnemyController>().forEach((enemy) {
      print(_dash.distance(enemy));
      if (_dash.distance(enemy) < kEnemySize) {
        _dash.hitAnimation();
      }
    });
  }

  @override
  void resize(Size size) {
    super.resize(size);
    _scoreTextComponent.setByPosition(
      Position((size.width / 2 - _scoreTextComponent.width / 2), 0),
    );
  }
}
