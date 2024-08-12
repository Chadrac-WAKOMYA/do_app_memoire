import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String msg}) {
  return Fluttertoast.showToast(msg: msg);
}

showSnackBar(
    {required BuildContext context,
    required String msg,
    Color color = Colors.black}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg, style: const TextStyle(color: Colors.white)),
    backgroundColor: color,
  ));
}