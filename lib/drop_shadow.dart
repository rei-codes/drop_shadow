library drop_shadow;

import 'dart:ui';

import 'package:flutter/material.dart';

/// Widget child; // required
///
///  Blur size of the shadow
///  double blurRadius; // default: 10.0
///
///  BorderRadius to the image and the shadow
///  double borderRadius; // default: 0.0
///
///  Position of the shadow
///  Offset offset; // default: Offset(0.0, 8.0)
///
///  Give opacity to the shadow
///  double opacity; // default: 1.0
///
///  size of the shadow
///  double spread; // default: 1.0
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

    /// [ClipRRect] to isolate [BackDropFilter] from other widgets
    return ClipRRect(
      child: Padding(
        /// Calculate Shadow's effect field
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Stack(
          children: [
            /// Arrange shadow position
            Transform.translate(
              offset: offset,

              /// Apply [BorderRadius] to the shadow
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),

                /// Apply [Opacity] to the shadow
                child: Opacity(
                  opacity: opacity,
                  child: child,
                ),
              ),
            ),

            /// Apply filter the whole [Stack] space
            Positioned.fill(
              /// Apply blur effect to the layer
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurRadius,
                  sigmaY: blurRadius,
                ),

                /// Filter effect field
                child: Container(color: Colors.transparent),
              ),
            ),

            /// [Widget] itself with given [BorderRadius]
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
