import 'package:flame/components/text_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flappy_bird/constant/game_constants.dart';
import 'package:flappy_bird/game_controller/dash_controller.dart';
import 'package:flappy_bird/game_controller/enemy_controller.dart';
import 'package:flappy_bird/game_controller/enemy_manager.dart';
import 'package:flappy_bird/main_game/audio_manager.dart';
import 'package:flappy_bird/main_game/high_score_manager.dart';
import 'package:flappy_bird/theme/dash_land.dart';
import 'package:flappy_bird/widgets/game_over_menu.dart';
import 'package:flappy_bird/widgets/hud.dart';
import 'package:flappy_bird/widgets/pause_menu.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame with TapDetector, HasWidgetsOverlay {
  DashController _dash;
  DashLand _theme;
  EnemyManager _enemyManager;
  TextComponent _scoreTextComponent;
  int score;
  bool _isGameOver = false;
  bool _isGamePaused = false;

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

    addWidgetOverlay(
      "hud",
      Hud(onPressed: _pauseGame, life: _dash.life),
    );
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    if (!_isGameOver && !_isGamePaused) {
      _dash.jump();
    }
  }

  @override
  void update(double time) {
    super.update(time);
    score += (60 * time).toInt();
    _scoreTextComponent.text = score.toString();

    components.whereType<EnemyController>().forEach(
      (enemy) {
        if (_dash.distance(enemy) < kEnemySize) {
          _dash.hitAnimation();
        }
      },
    );

    if (score > HighScoreManager.instance.getHighScore) {
      HighScoreManager.instance.setHighScore(score);
    }

    if (_dash.life.value <= 0) {
      gameOver();
    }
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        _pauseGame();
        break;
      case AppLifecycleState.paused:
        _pauseGame();
        break;
      case AppLifecycleState.detached:
        _pauseGame();
        break;
    }
  }

  @override
  void resize(Size size) {
    super.resize(size);
    _scoreTextComponent.setByPosition(
      Position((size.width / 2 - _scoreTextComponent.width / 2), 0),
    );
  }

  void _pauseGame() {
    pauseEngine();
    if (!_isGameOver) {
      _isGamePaused = true;
      addWidgetOverlay(
        'pauseMenu',
        PauseMenu(onPressed: _resumeGame),
      );
    }

    AudioManager.instance.pauseBgm();
  }

  _resumeGame() {
    removeWidgetOverlay("pauseMenu");
    _isGamePaused = false;
    resumeEngine();
    AudioManager.instance.resumeBgm();
  }

  void resetGame() {
    score = 0;
    _dash.resetGame();
    _dash.life.value = 3;
    _dash.flyAnimation();
    _enemyManager.resetGame();
    _isGameOver = false;
    components.whereType<EnemyController>().forEach(
      (enemy) {
        markToRemove(enemy);
      },
    );
    removeWidgetOverlay('gameOverMenu');
    resumeEngine();
    AudioManager.instance.resumeBgm();
  }

  void gameOver() {
    pauseEngine();
    _isGameOver = true;
    addWidgetOverlay(
      'gameOverMenu',
      GameOverMenu(
        onPressed: resetGame,
        score: score,
      ),
    );
    AudioManager.instance.pauseBgm();
  }

  @override
  void onDetach() {
    AudioManager.instance.stopBgm();
    super.onDetach();
  }
}
