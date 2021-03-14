import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  final Function onPressed;

  const PauseMenu({Key key, @required this.onPressed}) : super(key: key);

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
                "Paused",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.play_arrow),
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
