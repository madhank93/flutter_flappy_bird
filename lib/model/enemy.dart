import 'package:flutter/widgets.dart';

class Enemy {
  final String imageName;
  final int textureWidth;
  final int textureHeight;
  final int columns;
  final int rows;

  const Enemy({
    @required this.imageName,
    @required this.textureWidth,
    @required this.textureHeight,
    @required this.columns,
    @required this.rows,
  });
}
