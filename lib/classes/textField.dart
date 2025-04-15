import 'package:flutter/material.dart';
import 'package:vela/classes/colors.dart';

class TextFieldClass {

    
  bool visibility = true;
  bool remember = false;
  bool focusedPass = false;
  bool focusedEmail = false;
  final ColorsList colors = ColorsList();

 Widget inputText_with_prefix (TextEditingController controller, String hintText, Icon icon) {
    return TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "$hintText",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                      prefixIcon: Container(margin: EdgeInsets.only(left: 15, right: 10)  ,child: icon),
                      prefixIconColor: (!focusedEmail && focusedPass) ? Colors.grey.shade400 : colors.golapi,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    keyboardType: TextInputType.name,
                  );
  }


   Widget inputText_without_prefix (Function(dynamic v) onchange, TextEditingController controller,String hintText, TextInputType textInputType, ) {
    return TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "$hintText",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onChanged: onchange,
                    keyboardType: textInputType,
                  );
  }
}