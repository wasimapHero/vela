import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/colors.dart';

class MovieWidget_ForSerial_Class {

    final ColorsList colors = ColorsList();

  Widget movieWidget_ForSerial (double width1,double width2, String movie_title,String movie_duration,String movie_rating) {
    return  Container(
      margin: EdgeInsets.only(top: 15, left: 25, right: 20),
      // color: Colors.amber,
      height: 90,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: width1,
            height: 100,
            margin: EdgeInsets.only(right: 20),
            
            child: Stack(
              children: [
                ClipRRect( borderRadius: BorderRadius.circular(8), child: Image.asset("assets/images/illustration_svg/doctor-strange-2_3840x2160.jpg",
                height: 100, fit: BoxFit.cover, )),
                Positioned(
                  top: 32,
                  left: width1/2 -10,
                  child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset("assets/images/icons_svg/play.svg", height: 30, color: Colors.black,)),)
              ],
            )
            ),
            Container(
              width: width2,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(movie_title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, )),
                  Text(movie_duration, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 196, 180, 209),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(movie_rating, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: colors.beguni))),
                      SvgPicture.asset("assets/images/icons_svg/delete.svg", height: 15, color: colors.beguni,)
                    ],
                  ),
                ],
              )
              )
        ],
      ),
    );
  }


  Widget movieWidget_ForSerial_without_delete (double total_width, double width1,double width2, String movie_title,String movie_duration,String movie_rating) {
    return  Container(
      margin: EdgeInsets.only(bottom: 15, left: 25, right: 20),
      // color: Colors.amber,
      height: 90,
      width: total_width,
      child: Row(
        children: [
          Container(
            width: width1,
            height: 100,
            margin: EdgeInsets.only(right: 20),
            
            child: Stack(
              children: [
                ClipRRect( borderRadius: BorderRadius.circular(8), child: Image.asset("assets/images/illustration_svg/doctor-strange-2_3840x2160.jpg",
                height: 100, fit: BoxFit.cover, )),
                Positioned(
                  top: 32,
                  left: width1/2 -10,
                  child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset("assets/images/icons_svg/play.svg", height: 30, color: Colors.black,)),)
              ],
            )
            ),
            Container(
              width: width2,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(movie_title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, )),
                  Text(movie_duration, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 196, 180, 209),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(movie_rating, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: colors.beguni))),
                      
                    ],
                  ),
                ],
              )
              )
        ],
      ),
    );
  }

}