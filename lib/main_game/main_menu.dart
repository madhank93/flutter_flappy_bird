import 'package:flappy_bird/main_game/game_play.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/dash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Dash Fly",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return GamePlay();
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 50,
                        ),
                        Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.redAccent[400],
                    value: true,
                    title: Text(
                      'SFX',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    onChanged: (bool value) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.redAccent[400],
                    value: false,
                    title: Text(
                      'BGM',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    onChanged: (bool value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
