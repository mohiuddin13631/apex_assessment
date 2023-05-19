import 'package:flutter/material.dart';

import '../utils/custom_font.dart';

textFiledDecorator(String hintText){
  return InputDecoration(
    labelText: hintText,
    hintText: hintText,
    hintStyle: myStyle(18,const Color(0xff414141),FontWeight.w400),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffE0E0E0),width: 1)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffE0E0E0),width: 1)
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffE0E0E0),width: 1)
    ),
  );
}