import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4151b1),
                        Colors.grey.shade300,
                      ],
                      begin: const FractionalOffset(1, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: const [0.0, 5.0],
                      tileMode: TileMode.decal),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey.shade300,
              ),
            )
          ],
        ),
        child
      ],
    );
  }
}
