import 'package:flutter/material.dart';

class BackgroundGeneral extends StatelessWidget {
  final Widget child;
  const BackgroundGeneral({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/green_top.png",
              width: 200,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 240,
            child: Image.asset(
              "assets/images/green_bottom.png",
              width: 180,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
