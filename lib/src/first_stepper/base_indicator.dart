import 'package:flutter/material.dart';

import 'opacity_animated.dart';

class BaseIndicator extends StatelessWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;

  /// Whether this indicator is passed or not.
  final bool isPassed;

  /// The child to be placed within the indicator.
  final Widget child;

  /// Action to be taken when this indictor is pressed.
  final Function onPressed;

  /// Color of this indicator when it is not selected.
  final Color color;

  /// Color of this indicator when it is selected.
  final Color activeColor;

  /// Border color of this indicator when it is selected.
  final Color activeBorderColor;

  /// The border width of this indicator when it is selected.
  final activeBorderWidth;

  /// Radius of this indicator.
  final double radius;

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  /// Title.
  final String title;

  BaseIndicator({
    this.isSelected = false,
    this.isPassed = false,
    this.child,
    this.onPressed,
    this.color,
    this.title = "",
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OpacityAnimated(
          animationDisabled: !isSelected,
          child: Container(
            padding: isSelected ? EdgeInsets.all(margin) : EdgeInsets.zero,
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(
                color: activeBorderColor ?? Colors.blue,
                width: activeBorderWidth,
              )
                  : null,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: onPressed,
              child: OpacityAnimated(
                animationDisabled: !isSelected,
                child: isPassed ? Container(
                  height: radius * 2.5,
                  width: radius * 2.5,
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: activeColor ?? Colors.green, size: radius * 2.5,
                    ),
                  ),
                ) : Container(
                  height: radius * 2,
                  width: radius * 2,
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? activeColor ?? Colors.green
                        : color ?? Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(width: 80, child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),)
      ],
    );
  }
}
