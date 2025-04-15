import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vela/classes/colors.dart';

class Comments {
  String? userPhotoPath;
  String? userName;
  Text? comment_description;
  String? how_many_days_ago;

  Comments({required this.userPhotoPath, required this.userName, required this.comment_description, required this.how_many_days_ago});
}

class Comments_Class {

  final ColorsList colors = ColorsList();
 
  void see_all_comments () {
    

  }


  
  Widget comments_Widget (Function see_full_comments_fuction, List comments, double n_of_comments, bool see_full_comment, double comment_list_height, double com_sec_width) {

    return  Container(
      // color: Colors.grey,
      margin: EdgeInsets.only(top: 20, left: 15),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${n_of_comments}K Comments", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            GestureDetector(onTap: () {see_all_comments();} , child: Text("See all", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colors.beguni),)),
          ],
        ),
        // SizedBox(height: 5,),
        Container(
          height: comment_list_height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: comments.length,
            itemBuilder: (BuildContext context, index) {
              return  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            child: Image.asset("${comments[index].userPhotoPath}"),
                          ),
                          SizedBox(width: 10,),
                          Text(comments[index].userName.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SvgPicture.asset("assets/images/icons_svg/comments list.svg", width: 15,)
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: (!see_full_comment) ? 40 : 20,
                        width: com_sec_width -30,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (!see_full_comment) ? Text(comments[index].comment_description.toString(), softWrap: true,) : Text(comments[index].comment_description.toString().substring(0, 50), softWrap: true,),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          see_full_comments_fuction();
                        },
                        child: (!see_full_comment) ? Text("show more", style: TextStyle(fontSize: 12, color: colors.beguni)) : 
                        Text("show less", style: TextStyle(fontSize: 12, color: colors.beguni),)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [SvgPicture.asset("assets/images/icons_svg/red heart.svg", width: 15,),
                    SizedBox(width: 15,),
                    Text("${comments[index].how_many_days_ago}")],),
                    SizedBox(height: 10,)
                ],
              );
            }
            ),
        )
      ]),
    );
  }
}