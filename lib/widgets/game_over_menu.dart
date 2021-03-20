import 'package:flappy_bird/main_game/main_menu.dart';
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
            horizontal: 30,
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
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu_open,
                          size: 40,
                        ),
                        Text(
                          "Main menu",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return MainMenu();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.replay,
                          size: 40,
                        ),
                        Text(
                          "Reset",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    onTap: () {
                      onPressed.call();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
