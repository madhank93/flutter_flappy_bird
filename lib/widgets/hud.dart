import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
  final Function onPressed;
  final ValueNotifier<int> life;

  const Hud({Key key, @required this.onPressed, @required this.life})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.pause,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            onPressed.call();
          },
        ),
        ValueListenableBuilder(
          valueListenable: life,
          builder: (BuildContext context, int value, Widget child) {
            final list = <Widget>[];

            for (int i = 0; i < 3; i++) {
              list.add(
                Icon(
                  i < value ? Icons.favorite : Icons.favorite_border,
                  color: Colors.blue,
                ),
              );
            }
            return Row(
              children: list,
            );
          },
        )
      ],
    );
  }
}
