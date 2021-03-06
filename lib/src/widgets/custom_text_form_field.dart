import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../models/validators.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isRequiredField;
  final String? confirmPassword;
  final Function(String)? onChanged;
  final double? height;
  final double? width;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isRequiredField,
    this.confirmPassword,
    this.onChanged,
    this.height,
    this.width,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _fieldType = validateField.keys.contains(labelText.camelCase)
        ? labelText.camelCase
        : 'else';
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.15,
        width: width ?? MediaQuery.of(context).size.width * 0.24,
        child: TextFormField(
          obscureText:
              _fieldType.contains('password') || _fieldType.contains('Password')
                  ? true
                  : false,
          onTap: onTap ?? () {},
          onSaved: onSaved ?? (value) {},
          onChanged: onChanged ?? (value) {},
          onEditingComplete: onEditingComplete ?? () {},
          onFieldSubmitted: onFieldSubmitted ?? (value) {},
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: confirmPassword != null
              ? (value) =>
                  validateField[labelText.camelCase](value, confirmPassword)
              : (value) => validateField[_fieldType](value),
          controller: controller,
          cursorColor: const Color(0xFFA9915D),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: isRequiredField ? '$labelText*' : labelText,
            floatingLabelStyle: const TextStyle(
              color: Color(0xFF1A4859),
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
            isDense: true,
            errorMaxLines: 3,
            errorStyle: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.w600,
            ),
            alignLabelWithHint: true,
            focusColor: const Color(0xFFA9915D),
            labelStyle: const TextStyle(
              color: Color(0xFF1A4859),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFA9915D),
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFA9915D),
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFA9915D),
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade700,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(60)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade700,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(60)),
            ),
          ),
          style: const TextStyle(
            color: Color(0xFF1A4859),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
