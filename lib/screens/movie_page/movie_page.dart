// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'package:vela/classes/button_long.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/comments.dart';
import 'package:vela/classes/movieWidget_forserial.dart';
import 'package:vela/classes/movie_grid_movie.dart';
import 'package:vela/model/movieDetailsModel.dart';

class MoviePage extends StatefulWidget {

  //  List castNames;
  //  List<String> castPhotos;
  //  List<String> castCharacters;
  //  List<String> info_Of_movie;
  List movieList;
  String poster_path;
  String title;
  String release_date;
  String overView;
  MoviePage({
    Key? key,
    required this.movieList,
    required this.poster_path,
    required this.title,
    required this.release_date,
    required this.overView,
  }) : super(key: key);




  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  
  final ColorsList colors = ColorsList();
  final ButtonLong buttons = ButtonLong();
  final MovieWidget_ForSerial_Class movieWidget_ForSerial = MovieWidget_ForSerial_Class();
  final Movie_Grid_Movie_Class movie_Grid_Movie  = Movie_Grid_Movie_Class();
  final Comments_Class comments_class = Comments_Class();

  bool trailers_isVisible = true;
  bool more_isVisible = false;
  bool comments_isVisible = false;

  String mov_description = "";
  bool show_more = true;
  late String firstHalf ;
  late String secondHalf ;
  
  bool see_full_comment = true;
  String full_comment = "Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her. On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down. Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers. Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart";
  

  late String firstHalf_comment ;
  late String secondHalf_comment ;

String _api_key = "02dddcfb8f0c5af3f18c477c9da516d9";
  final _api_Read_Access_Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmRkZGNmYjhmMGM1YWYzZjE4YzQ3N2M5ZGE1MTZkOSIsInN1YiI6IjY1NjZmZTVkM2Q3NDU0MDEyY2NkNDE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TgpAlu0FhUCjpu9rTgYQDkh_gIBhA12wqAnVLG1a1Ak";

  List movieDetails = [];
  

  void getMovieDetails () async {
    TMDB tmdbWithLogs = TMDB(
      ApiKeys(_api_key, _api_Read_Access_Token),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true)
      );

  // Map movieDetailsMap = await tmdbWithLogs.v3.movies.getDetails(movieId);
  }

 @override
  void initState() {
    // TODO: implement initState

    // movies details
    getMovieDetails();  
    // print(movieId);


    if (mov_description.length > 50) {
      firstHalf = mov_description.substring(0, 50);
      secondHalf = mov_description.substring(50, mov_description.length);
    } else{
      firstHalf = mov_description;
      secondHalf = "";
    }

    // comments er jonno
    if (full_comment.length > 50) {
      firstHalf_comment = full_comment.substring(0, 50);
      secondHalf_comment = full_comment.substring(50, full_comment.length);
    } else{
      firstHalf_comment = full_comment;
      secondHalf_comment = "";
    }
  
    super.initState();
  }
  

   double n_of_comments = 24.6;
   
   
  List<Comments> all_comments = [

    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "Shakila Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "3 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "A Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "1 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "B Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "2 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "C Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "4 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "D Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "7 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "E Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "10 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "Shakila Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "3 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "A Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "1 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "B Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "2 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "C Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "4 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "D Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "7 days ago"),
    Comments(userPhotoPath: "assets/images/icons_svg/text vela logo-01.png", userName: "E Ahmed", 
    comment_description: Text("Meerab definately 'pal me tola pal me masha' kitne rang badlti ye yaar !! Akhir murtu kre to kre kya. Meerab is an ambitious and beautiful young girl who wants to pursue higher studies. Her entire world revolves around her parents and she believes in them the most. Her strong and confident personality makes her stand against social injustices around her.On the contrary, Murtasim hails from a powerful and influential family. He respects and values the morals and traditions of his family and refuses to let the family down.Meerab’s life takes an unexpected turn when she finds out about her family’s decision regarding her and Murtasim’s life. Meerab’s hatred towards Murtasim continues to grow as a family secret from the past resurfaces. Coming from different backgrounds and mindsets, Murtasim begins to realize Meerab’s arrogant behaviour towards him and begins to consider her a challenge for himself. On the other hand, Meerab who is used to living her life on her own terms refuses to accept Murtasim’s family traditions and unnecessary social barriers.Soon their lives go through a series of emotional sufferings and misunderstandings where it becomes difficult for them to coexist. Despite their hatred towards each other, will Meerab and Murtasim accept their true feelings or will the dynamics of ego and self-respect force them to stay apart?"), 
    how_many_days_ago: "10 days ago"),
  ];


//  late int movieId; 
  @override
  Widget build(BuildContext context) {

    // movieId = ModalRoute.of(context)?.settings.arguments as int;
    // print(movieId);

     var movie_height = MediaQuery.of(context).size.height*(1/3)-40;
        var movie_width = MediaQuery.of(context).size.width*(1/2)-40;


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3 - 10,
              child: Stack(
                children: [
                  Image.network("http://image.tmdb.org/t/p/w500"+"${widget.poster_path}", height: MediaQuery.of(context).size.height/3 - 10),
                  Positioned(left: 20, top: 40 , child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white,)))
                ],
              ),
            ),
           Container(
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height*(2/3) ,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: Colors.white,
                 height: MediaQuery.of(context).size.height*(2/3) ,
                child: Column(
                  children: [ 
                    Container(
              height: 120,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 40, width: MediaQuery.of(context).size.width*(2.2/3),
                        child: Text("${widget.title}", softWrap: false, overflow: TextOverflow.ellipsis, maxLines: 2,
                        style: TextStyle(fontSize: 14 ,color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/icons_svg/my list.svg", height: 18,),
                          SizedBox(width: 10,),
                          SvgPicture.asset("assets/images/icons_svg/comment send.svg", height: 18,),],
                      )
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/icons_svg/fill star.svg",height: 14, width: 14, color: const Color.fromARGB(255, 107, 33, 243),),
                            Text(" 3.4", style: TextStyle(fontSize: 13 ,color: colors.beguni , fontWeight: FontWeight.w500)),
                            Icon(Icons.arrow_forward_ios,size: 14,),
                            Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text("${widget.release_date.toString().substring(0,4)}", style: TextStyle(fontSize: 13 ,color: Colors.black)),
                      ),
                          ],
                        ),
                      ),
                      
                      //  Container(
                      //   padding: EdgeInsets.only(),
                      //   height: 25, 
                      //   width: MediaQuery.of(context).size.width*(1.6/3),
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 8,
                      //     itemBuilder: (BuildContext context, index) {
                      //       return Container(
                      //         padding: EdgeInsets.all(5),
                      //         margin: EdgeInsets.only(right: 7),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: Color.fromARGB(255, 239, 236, 247)
                      //         ),
                      //         child: Text("Fantasy", style: TextStyle(fontSize: 11 ,color: colors.beguni),),
                      //       );
                      //     }
                      //     ),
                      // )
                    ],
                  ),

                  SizedBox(height: 15,),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buttons.long_button_color_with_icon(MediaQuery.of(context).size.width*(1.3/3), Color(0xff51007e), "Play", Colors.white, "assets/images/icons_svg/play.svg"),
                      buttons.long_button_color_with_icon(MediaQuery.of(context).size.width*(1.3/3), Colors.white, "Download", Color(0xff51007e), "assets/images/icons_svg/download.svg"),
                    ],
                  ),
                  

                 ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
              
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: (show_more) ? Text("${widget.overView.toString().substring(0,30)}" + "...", style: TextStyle(fontSize: 13)) : 
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70, 
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("${widget.overView}", style: TextStyle(fontSize: 13),)))) ,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show_more = !show_more;
                        });
                      },
                      child: (show_more) ? Text("Show More", style: TextStyle(fontSize: 12 , color: colors.beguni, fontWeight: FontWeight.w500),)
                              :
                              Text("Show Less", style: TextStyle(fontSize: 12 , color: colors.beguni, fontWeight: FontWeight.w500),),
                      ),
                      ],
                    ),
                  ),
              
                   Container(
                    height: 50, width:  MediaQuery.of(context).size.width-60,
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    // child: ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: 10,
                    //   itemBuilder: (BuildContext context, index) {
                    //     return  Container(
                    //       width: 100,
                    //       height: 50,
                    //       // padding: EdgeInsets.all(5),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 15,
                    //             child: Image.asset("assets/images/icons_svg/vela pic logo-01.png", height: 10,),
                    //           ),
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text("wasima \n akhter", softWrap: true, maxLines: 2, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
                    //               Text("Director",softWrap: true,  style: TextStyle(fontSize: 11, color: Colors.grey),),
                    //             ],
                    //           ),
                    //           SizedBox(width: 8,)
                    //         ],
                    //       ),
                          
                    //     );
                    //   }
                    //   ),
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13,),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2, color: (trailers_isVisible)? Color(0xff51007e) : Colors.grey.shade500))
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              trailers_isVisible = true;
                            more_isVisible = false;
                            comments_isVisible = false;
                            });
                          },
                          child: Text("Trailers", style: TextStyle(fontSize: 13 , color: (trailers_isVisible)? colors.beguni: Colors.grey.shade500, 
                          fontWeight: FontWeight.w500),)),
                      ),
                      
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13,),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2, color: (more_isVisible)? Color(0xff51007e) : Colors.grey.shade500))
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              more_isVisible = true;
                            trailers_isVisible = false;
                            comments_isVisible = false;
                            });
                          },
                          child: Text("More Like This", style: TextStyle(fontSize: 13 , color: (more_isVisible)? colors.beguni: Colors.grey.shade500, 
                          fontWeight: FontWeight.w500),)),
                      ),
                          
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13,),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2, color: (comments_isVisible)? Color(0xff51007e) : Colors.grey.shade500))
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              comments_isVisible = true;
                            trailers_isVisible = false;
                            more_isVisible = false;
                            });
                          },
                          child: Text("Comments", style: TextStyle(fontSize: 13 , color: (comments_isVisible)? colors.beguni: Colors.grey.shade500, 
                          fontWeight: FontWeight.w500),)),
                      ),
                    ],
                  ),
                  
                 Visibility(
                  visible: trailers_isVisible,
                   child: Container(
                    // color: Colors.blue,
                     padding: const EdgeInsets.only(right: 10.0, top: 10),
                     height: MediaQuery.of(context).size.height/3 - 20 ,
                     child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return movieWidget_ForSerial.movieWidget_ForSerial_without_delete(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width*(1/2)-50, MediaQuery.of(context).size.width*(1/2)-80, "LightYear", "1h 42m 33s", "6.5/10");
                      },
                     ),
                   ),
                 ),
                 
                 Visibility(
                  visible: more_isVisible,
                   child: Container( 
                    height: MediaQuery.of(context).size.height/3 - 20 ,
                    padding: EdgeInsets.only(top: 20, left: 25),
                  
                  // color: Colors.blue,
                     child: CustomScrollView(
                                scrollDirection: Axis.vertical,
                                primary: false,
                                shrinkWrap: true,
                                slivers: [
                                  SliverGrid.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  // mainAxisSpacing: 5,
                                  childAspectRatio: (movie_width/movie_height),
                                                        crossAxisCount: 2), 
                                itemBuilder: (BuildContext context, index) {
                                  return  movie_Grid_Movie.movie_Grid_Movie( [],movie_height, movie_width) ;
                                }
                                    )
                                ],
                              )
                   ),
                 ),
                      
                 Visibility(
                  visible: comments_isVisible,
                   child: Container( 
                    // color: Colors.blue,
                    height: MediaQuery.of(context).size.height/3 - 20,
                     padding: const EdgeInsets.only(right: 10.0),
                     child: comments_class.comments_Widget( (){setState(() {
                       see_full_comment = !see_full_comment;
                     });}, all_comments, n_of_comments, see_full_comment, MediaQuery.of(context).size.height*(1/3)- 70, MediaQuery.of(context).size.width)
                   ),
                 ),
                      
                      
                ],
              ),
            ),
            ],
                ),
              ),
            ),
           )
          ],
        ),
      ),
    );
  }
}