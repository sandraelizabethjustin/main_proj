//same code that have to be used in more ways .it is the styling of textfield of email and password of signi and reg pages
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  //p14
 // hintText: 'Email',
  fillColor: Colors.white, //Color(0xFFEFEBE9),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);
