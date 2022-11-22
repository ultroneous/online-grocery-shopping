import 'package:flutter/material.dart';

mixin ProgressDialog {
  static bool _isDialogVisible = false;

  static show(BuildContext context) {
    _isDialogVisible = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color(0xFF082A4F),
          ));
        });
  }

  static hide(BuildContext context) {
    if (_isDialogVisible) {
      _isDialogVisible = false;
      Navigator.pop(context);
    }
  }
}
