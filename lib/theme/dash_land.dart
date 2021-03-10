import 'dart:ui';

import 'package:flame/components/parallax_component.dart';

class DashLand extends ParallaxComponent {
  DashLand()
      : super(
          [
            ParallaxImage("parallax/parallax-1.png"),
            ParallaxImage("parallax/parallax-2.png", fill: LayerFill.none),
          ],
          baseSpeed: Offset(100, 0),
          layerDelta: Offset(20, 0),
        );
}
