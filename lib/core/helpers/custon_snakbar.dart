import 'package:flutter/material.dart';

customSnakbar(BuildContext context, SnackBar snackBar) {
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
