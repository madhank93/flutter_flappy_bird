import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame {
  AnimationComponent _dash;
  ParallaxComponent _parallax;

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

    _dash.x = 100;
    _dash.y = 100;

    _parallax = ParallaxComponent(
      [
        ParallaxImage("parallax/parallax-1.png"),
        ParallaxImage("parallax/parallax-2.png", fill: LayerFill.none),
      ],
      baseSpeed: Offset(100, 0),
      layerDelta: Offset(20, 0),
    );

    add(_parallax);

    add(_dash);
  }
}
