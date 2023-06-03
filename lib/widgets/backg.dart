import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.7],
              colors: [
                Color.fromRGBO(32, 32, 32, 1),
                Color.fromRGBO(39, 41, 66, 1)
              ],
            ),
          ),
        ),
        const Box()
      ],
    );
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 4,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfff00a2f), Color(0xff373856)],
          ),
        ),
      ),
    );
  }
}
