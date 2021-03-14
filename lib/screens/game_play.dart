import 'package:flappy_bird/screens/flappy_bird_game_controller.dart';
import 'package:flutter/material.dart';

class GamePlay extends StatefulWidget {
  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  FlappyBird _flappyBird;

  @override
  void initState() {
    super.initState();
    _flappyBird = FlappyBird();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _flappyBird.widget,
    );
  }
}
