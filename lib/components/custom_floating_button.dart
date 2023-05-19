import 'dart:convert';

import 'package:apex_assessment/utils/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/custom_color.dart';
import '../view/new_company_dialog_screen.dart';
import 'text_field_decorator.dart';
class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      onPressed: () {
        showDialog(context: context, builder: (context) {
          return NewCompanyDialog();
        },);
      },
      child: Text("Create Company",style: TextStyle(color: Colors.white),),

    );
  }
}

