// ignore_for_file: prefer_const_constructors

import 'package:do_app/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool isPass;
  final int line;
  final keyboard;
  final icon;
  String err;
  String _value = '';
  String? iinitialValue;
  TextEditingController? controller = TextEditingController();

  CustomTextField(
      {this.title = '',
      this.placeholder = '',
      this.isPass = false,
      this.err = 'Veuillez spécifier ce champ !',
      this.line = 1,
      this.keyboard = TextInputType.text,
      this.icon,
      this.controller});

  TextFormField textFormField() {
    return TextFormField(
      controller: controller,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) => e!.isEmpty ? err : null,
      obscureText: isPass,
      maxLines: line,
      keyboardType: keyboard,
      // initialValue: iinitialValue == null ? null : iinitialValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        labelText: title,
        labelStyle: TextStyle(color: Constant.mainColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondColor,
          ),
        ),
        hintText: placeholder,
        prefixIcon: Icon(icon),
      ),
    );
  }

  String get value {
    return _value;
  }
}