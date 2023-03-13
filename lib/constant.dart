import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  hintText: "Email",
  filled: true,

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white,width: 2.0),//border decoration when its not active
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade400,width: 2.0),//border decoration when we tap on the text field
  ),
);