import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    this.text = '',
    this.image = '',
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "SERBINI",
          style: TextStyle(
            fontSize: (36),
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: (265),
          width: (235),
        ),
      ],
    );
  }
}
