import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final bool isShowIcon;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.isShowIcon = false,
    this.onSaved,
    this.validator,
    required this.label,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffFDFDFF),
        suffixIcon: widget.isShowIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.gray,
                ),
              )
            : null,
        labelText: widget.label,
        labelStyle: Styles.font14WhiteMedium,
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(AppColors.mainBlue),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error),
      ),
    );
  }

  OutlineInputBorder _border([Color color = AppColors.lightGray]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color),
      );
}
