import 'package:flame/components/parallax_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flappy_bird/characters/dash.dart';
import 'package:flutter/material.dart';

class FlappyBird extends BaseGame {
  Dash _dash;
  ParallaxComponent _parallax;

  FlappyBird() {
    _parallax = ParallaxComponent(
      [
        ParallaxImage("parallax/parallax-1.png"),
        ParallaxImage("parallax/parallax-2.png", fill: LayerFill.none),
      ],
      baseSpeed: Offset(100, 0),
      layerDelta: Offset(20, 0),
    );

    add(_parallax);

    _dash = Dash();
    add(_dash);
  }
}
