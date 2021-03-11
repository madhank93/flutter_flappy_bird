import 'package:flutter/widgets.dart';

class EnemyData {
  final String imageName;
  final int textureWidth;
  final int textureHeight;
  final int columns;
  final int rows;

  const EnemyData({
    @required this.imageName,
    @required this.textureWidth,
    @required this.textureHeight,
    @required this.columns,
    @required this.rows,
  });
}
