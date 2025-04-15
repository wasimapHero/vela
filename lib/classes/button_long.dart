import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/screens/homepage.dart';

class ButtonLong {

  final ColorsList colors = ColorsList();

  Widget long_button_golapi(double width, String text) {
    return Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                      color: colors.golapi,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      )],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text("$text",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ))),
    );
  }
  

    Widget long_button_white(String iconString, double width, String text) {
    return Container(
                  width: width,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                      offset: const Offset(
                        3.0,
                        3.0,
                      ),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      )],
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(iconString, width: 20, ),
                      SizedBox(width: 10),
                      Center(
                          child: Text("$text",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ))),
                    ],
                  ),
    );
  }

  Widget long_button_beguni(double width, String text) {
    return Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                      color: colors.beguni,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      )],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text("$text",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ))),
    );
  }

  Widget long_button_color_with_icon(double width, Color fillColor, String text, Color textColor, String svg) {
    return Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                      color: fillColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      )],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: Color(0xff51007e))
                      ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(svg, color: colors.beguni,),
                          ),
                          SizedBox(width: 8,),
                          Text("$text",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: textColor,
                              )),
                        ],
                      )),
    );
  }

  Widget squareIconButton(String icon) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 245, 244, 246),
        border: Border.all(width: 1, color:  Color.fromARGB(255, 149, 156, 216)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.5, 0.5),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            color: const Color.fromARGB(255, 238, 238, 238)
          ),
        ]
      ),
      child: CircleAvatar(backgroundColor: Colors.transparent, radius: 0, child: Image.asset("$icon", height: 25, width: 25, fit: BoxFit.cover,)),
    );
  }

    Widget shortButton(Color color, double width, String text, Color textColor) {
    return Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                      color: color,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      )],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text("$text",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ))),
    );
  }

}
