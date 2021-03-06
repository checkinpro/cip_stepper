import 'package:flutter/material.dart';

import 'base_stepper.dart';

class NumberStepper extends StatelessWidget {
  /// Each number defines a step. Hence, total count of numbers determines the total number of steps.
  final List<String> title;

  /// Whether to enable or disable the next and previous buttons.
  final bool enableNextPreviousButtons;

  /// Whether to allow tapping a step to move to that step or not.
  final bool enableStepTapping;

  /// Icon to be used for the previous button.
  final Icon previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon nextButtonIcon;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The style applied to numbers except the `fontSize` which is calculated automatically.
  final TextStyle numberStyle;

  /// The color of the step when it is not reached.
  final Color stepColor;

  /// The amount of padding inside a step.
  final double stepPadding;

  /// The color of a step when it is reached.
  final Color activeStepColor;

  /// The border color of a step when it is reached.
  final Color activeStepBorderColor;

  /// The border width of the active step.
  final double activeStepBorderWidth;

  /// Determines how far away the border should be drawn from the step when it is reached.
  final double activeStepBorderPadding;

  /// The color of the line that separates the steps.
  final Color lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Whether to go to the next step or not.
  final bool goNext;

  /// Whether to go the next step or not.
  final bool goPrevious;

  /// Whether the scrolling is disabled or not.
  final bool scrollingDisabled;

  /// Controls which `BaseStepper` constructor to call.
  final bool _isExternallyControlled;

  /// Current index
  final selectedIndex;

  /// Used when the stepper is controlled externally using the `goNext` and `goPrevious` properties. In which case, two variables must be maintained in a StatefulWidget to set the values of `gotNext` and `goPrevious` in a call to `setState()`, and if the stepping is moving foward `gotNext` must be set to true and `goPrevious` must be set to `false`. If moving backward `goPrevious` must be set to `true` and `goNext` must be set to `false`.
  ///
  /// For more information, see example [here](https://pub.dev/packages/im_stepper/example).
  NumberStepper.externallyControlled({
    this.direction = Axis.horizontal,
    this.numberStyle = const TextStyle(color: Colors.black),
    this.stepColor,
    this.stepPadding = 1.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 5.0,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.goNext,
    this.goPrevious,
    this.scrollingDisabled = false,
    this.selectedIndex = 0,
    this.title,
  })  : this.enableNextPreviousButtons = false,
        this.enableStepTapping = false,
        this.previousButtonIcon = null,
        this.nextButtonIcon = null,
        this.onStepReached = null,
        this._isExternallyControlled = true;

  /// Used when the stepping is controller either by using the built-in next/previous buttons or by tapping. If stepping needs to be controlled externally then using the `BaseStepper.externallyControlled` constructor is a more optimized approach.
  NumberStepper({
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.numberStyle = const TextStyle(color: Colors.black),
    this.stepColor,
    this.stepPadding = 0.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 1.0,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.scrollingDisabled = false,
    this.selectedIndex = 0,
    this.title,
  })  : _isExternallyControlled = false,
        this.goNext = false,
        this.goPrevious = false;

  @override
  Widget build(BuildContext context) {
    return _isExternallyControlled
        ? BaseStepper.externallyControlled(
            children: _numbersWrappedInText(),
            direction: direction,
            stepColor: stepColor,
            activeStepColor: activeStepColor,
            activeStepBorderColor: activeStepBorderColor,
            activeStepBorderWidth: activeStepBorderWidth,
            lineColor: lineColor,
            lineLength: lineLength,
            lineDotRadius: lineDotRadius,
            stepRadius: stepRadius,
            stepReachedAnimationEffect: stepReachedAnimationEffect,
            stepReachedAnimationDuration: stepReachedAnimationDuration,
            steppingEnabled: steppingEnabled,
            margin: activeStepBorderPadding,
            padding: stepPadding,
            scrollingDisabled: scrollingDisabled,
            goNext: goNext,
            title: title,
            goPrevious: goPrevious,
            selectedIndex: selectedIndex,
          )
        : BaseStepper(
            children: _numbersWrappedInText(),
            enableNextPreviousButtons: enableNextPreviousButtons,
            enableStepTapping: enableStepTapping,
            previousButtonIcon: previousButtonIcon,
            nextButtonIcon: nextButtonIcon,
            onStepReached: onStepReached,
            direction: direction,
            stepColor: stepColor,
            activeStepColor: activeStepColor,
            activeStepBorderColor: activeStepBorderColor,
            activeStepBorderWidth: activeStepBorderWidth,
            lineColor: lineColor,
            lineLength: lineLength,
            lineDotRadius: lineDotRadius,
            stepRadius: stepRadius,
            stepReachedAnimationEffect: stepReachedAnimationEffect,
            stepReachedAnimationDuration: stepReachedAnimationDuration,
            steppingEnabled: steppingEnabled,
            margin: activeStepBorderPadding,
            padding: stepPadding,
            title: title,
            scrollingDisabled: scrollingDisabled,
            selectedIndex: selectedIndex,
          );
  }

  /// Wraps the integer numbers in Text widget. User style is also applied except the `fontSize` which is calculated automatically.
  List<Widget> _numbersWrappedInText() {
    return List.generate(title.length, (index) {
      return FittedBox(
        child: Text(
          '${index + 1}',
          style: numberStyle.copyWith(fontSize: stepRadius / 1.1, color: Colors.white),
        ),
      );
    });
  }
}
