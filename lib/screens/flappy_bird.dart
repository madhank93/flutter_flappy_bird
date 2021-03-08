import 'package:flame/components/animation_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/spritesheet.dart';

class FlappyBird extends BaseGame {
  AnimationComponent _dash;

  FlappyBird() {
    _dash = AnimationComponent.empty();

    final spriteSheet = SpriteSheet(
      imageName: "dash-final.png",
      textureWidth: 600,
      textureHeight: 600,
      columns: 2, // refers to image
      rows: 1, // refers to image
    );

    _dash.animation = spriteSheet.createAnimation(0, stepTime: .1);

    _dash.width = 120;
    _dash.height = 120;

    add(_dash);
  }
}
