library drop_shadow;

import 'dart:ui';

import 'package:flutter/material.dart';

class DropShadow extends StatelessWidget {
  final Widget child;
  final double blurRadius;
  final double borderRadius;
  final Offset offset;
  final double opacity;
  final double spread;

  const DropShadow({
    Key? key,
    required this.child,
    this.blurRadius = 10.0,
    this.borderRadius = 0.0,
    this.offset = const Offset(0.0, 8.0),
    this.opacity = 1.0,
    this.spread = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double left = 0;
    double right = 0;
    double top = 0;
    double bottom = 0;

    left = (offset.dx.abs() + (blurRadius * 2)) * spread;
    right = (offset.dx + (blurRadius * 2)) * spread;
    top = (offset.dy.abs() + (blurRadius * 2)) * spread;
    bottom = (offset.dy + (blurRadius * 2)) * spread;

    return ClipRRect(
      child: Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Stack(
          children: [
            Transform.translate(
              offset: offset,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Opacity(
                  opacity: opacity,
                  child: child,
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurRadius,
                  sigmaY: blurRadius,
                ),
                child: Container(color: Colors.transparent),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
