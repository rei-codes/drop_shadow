library drop_shadow;

import 'dart:ui';

import 'package:flutter/material.dart';

/// Help to create drop shadow effect using [BackdropFilter]
class DropShadow extends StatelessWidget {
  /// Create DropShadow for any kind of widget with default values
  const DropShadow({
    required this.child,
    this.blurRadius = 10.0,
    this.borderRadius = 0.0,
    this.offset = const Offset(0, 8),
    this.opacity = 1.0,
    this.spread = 1.0,
    this.color,
    super.key,
  });

  /// Your widget comes here :)
  final Widget child;

  /// Blur radius of the shadow
  final double blurRadius;

  /// BorderRadius to the image and the shadow
  final double borderRadius;

  /// Position of the shadow
  final Offset offset;

  /// Opacity of the shadow
  final double opacity;

  /// Size of the shadow
  final double spread;

  /// Color of the shadow
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var left = 0.0;
    var right = 0.0;
    var top = 0.0;
    var bottom = 0.0;

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
                  child: color == null
                      ? child
                      : ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            color!,
                            BlendMode.modulate,
                          ),
                          child: child,
                        ),
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
                child: const ColoredBox(color: Colors.transparent),
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
