import 'package:flappy_bird/screens/flappy_bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
