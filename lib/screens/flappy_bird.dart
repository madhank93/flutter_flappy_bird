import 'package:flame/components/text_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flappy_bird/constant/game_constants.dart';
import 'package:flappy_bird/controller/dash_controller.dart';
import 'package:flappy_bird/controller/enemy_controller.dart';
import 'package:flappy_bird/controller/enemy_manager.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector, HasWidgetsOverlay {
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

    addWidgetOverlay("hud", _headsOverDisplay());
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

  Widget _headsOverDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.pause,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            _pauseGame();
          },
        ),
        ValueListenableBuilder(
          valueListenable: _dash.life,
          builder: (BuildContext context, int value, Widget child) {
            final list = <Widget>[];

            for (int i = 0; i < 3; i++) {
              list.add(
                Icon(
                  i < value ? Icons.favorite : Icons.favorite_border,
                  color: Colors.blue,
                ),
              );
            }
            return Row(
              children: list,
            );
          },
        )
      ],
    );
  }

  void _pauseGame() {
    pauseEngine();
    addWidgetOverlay('pauseMenu', _buildPauseMenu());
  }

  Widget _buildPauseMenu() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Paused",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    _resumeGame();
                  })
            ],
          ),
        ),
      ),
    );
  }

  _resumeGame() {
    removeWidgetOverlay("pauseMenu");
    resumeEngine();
  }
}
