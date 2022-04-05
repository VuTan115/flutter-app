import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double _width;
  final double _height;

  const Separator({double width = 0, double height = 16})
      : this._width = width,
        this._height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
    );
  }
}
