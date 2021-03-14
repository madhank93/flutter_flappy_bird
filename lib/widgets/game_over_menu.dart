import 'package:flutter/material.dart';

class GameOverMenu extends StatelessWidget {
  final Function onPressed;
  final int score;

  const GameOverMenu({Key key, @required this.onPressed, @required this.score})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Game Over",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Your score is $score",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    onPressed.call();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
