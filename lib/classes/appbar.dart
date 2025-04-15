import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar {

  Widget customAppBar (String title, double width) {
    return Container(
                            height: 50, width: width,
                            padding: EdgeInsets.only(left: 18), 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset("assets/images/icons_svg/vela pic logo-01.png", fit: BoxFit.cover, height: double.infinity, width: double.infinity,)
                                    ),
                                    SizedBox(width: 10,),
                                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                                ],
                              ),
                          
                               SvgPicture.asset("assets/images/icons_svg/search.svg", height: 20, color: Colors.white,),
                               SizedBox(width: 10,)
                            ],
                          ));
  }
}