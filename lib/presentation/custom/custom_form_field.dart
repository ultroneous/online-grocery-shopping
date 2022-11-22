import 'package:flutter/material.dart';

import '../../constants/color.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String hint,
    required Function(String value) validator,
    // required Widget preIcon,
    this.postIconBtn,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
  })  : _keyboardType = keyboardType,
        _inputAction = inputAction,
        _hint = hint,
        _controller = controller,
        _validator = validator,
        super(key: key);

  final TextInputType _keyboardType;
  final TextInputAction _inputAction;
  final Widget? postIconBtn;
  final String _hint;

  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnabled;
  final TextEditingController _controller;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: TextFormField(
        controller: _controller,
        style: TextStyle(
            color:
                isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        maxLines: maxLines,
        keyboardType: _keyboardType,
        obscureText: isObscure,
        textInputAction: _inputAction,
        cursorColor:
            isDarkMode ? AppColors.simplewhite : AppColors.commenTextColor,
        validator: (value) => _validator(value!),
        decoration: InputDecoration(
            suffixIcon: postIconBtn,
            hintText: _hint,
            hintStyle: TextStyle(
                fontSize: 16.0,
                color:
                    isDarkMode ? AppColors.subtextdark : AppColors.subtextlight,
                fontWeight: FontWeight.w500),
            fillColor: Theme.of(context).cardColor,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
      ),
    );
  }
}
