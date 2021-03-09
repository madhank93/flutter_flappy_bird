import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';

class Dash extends AnimationComponent {
  Dash() : super.empty() {
    final spriteSheet = SpriteSheet(
      imageName: "dash-final.png",
      textureWidth: 600,
      textureHeight: 600,
      columns: 2, // refers to image
      rows: 1, // refers to image
    );

    this.animation = spriteSheet.createAnimation(0, stepTime: .1);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    this.width = this.height = 80;

    this.x = size.height / 5;
    this.y = size.width / 1.5;
  }
}
