import 'dart:async';

import 'package:flutter/material.dart';

const int aSec = 1;

const String _secPostFix = 's';
const String labelSplitter = " in 00:";

class CustomeTimer extends StatefulWidget {
  ///label
  final String label;

  ///secPostFix
  final String secPostFix;

  ///[timeOutInSeconds] after which the button is enabled
  final int timeOutInSeconds;

  ///[onPressed] Called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  final bool resetTimerOnPressed;

  const CustomeTimer({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.timeOutInSeconds,
    this.secPostFix = _secPostFix,
    this.resetTimerOnPressed = true,
  }) : super(key: key);

  @override
  _CustomeTimerState createState() => _CustomeTimerState();
}

class _CustomeTimerState extends State<CustomeTimer> {
  bool timeUpFlag = false;
  int timeCounter = 0;

  String get _timerText => '$timeCounter${widget.secPostFix}';

  @override
  void initState() {
    super.initState();
    timeCounter = widget.timeOutInSeconds;
    _timerUpdate();
  }

  _timerUpdate() {
    Timer(const Duration(seconds: aSec), () async {
      setState(() {
        timeCounter--;
      });
      if (timeCounter != 0) {
        _timerUpdate();
      } else {
        timeUpFlag = true;
      }
    });
  }

  Widget _buildChild() {
    return Container(
      child: timeUpFlag
          ? Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black38,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            )
          : Text(
              widget.label + labelSplitter + _timerText,
              style: const TextStyle(
                color: Colors.black38,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
    );
  }

  _onPressed() {
    if (timeUpFlag) {
      setState(() {
        timeUpFlag = false;
      });
      timeCounter = widget.timeOutInSeconds;

      widget.onPressed();

      // reset the timer when the button is pressed
      if (widget.resetTimerOnPressed) {
        _timerUpdate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: _buildChild(),
    );
  }
}
