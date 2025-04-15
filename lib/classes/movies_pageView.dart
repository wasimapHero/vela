
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/model/movieDetailsModel.dart';
import 'package:vela/screens/movie_page/movie_page.dart';



class Movies_pageView_Class {


  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();

  // image path
  // Image.network("http://image.tmdb.org/t/p/w500"+top_10_moviesList[index]['poster_path'])

Widget Movies_pageView_Widget (String viewTitle, List top_10_moviesList , double movie_height,) {



       String _api_key = "02dddcfb8f0c5af3f18c477c9da516d9";
  final _api_Read_Access_Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmRkZGNmYjhmMGM1YWYzZjE4YzQ3N2M5ZGE1MTZkOSIsInN1YiI6IjY1NjZmZTVkM2Q3NDU0MDEyY2NkNDE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TgpAlu0FhUCjpu9rTgYQDkh_gIBhA12wqAnVLG1a1Ak";

  TMDB tmdbWithLogs = TMDB(
      ApiKeys(_api_key, _api_Read_Access_Token),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true)
      );

      List<String> castNames = [];
      List<String> castPhotos = [];
      List<String> castCharacters = [];
      List<String> info_Of_movie = [];
      ValueNotifier<List> cast;
      
     
      
       
  
  return  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(viewTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("See all    ", style: TextStyle(fontSize: 13, color: colors.golapi, fontWeight: FontWeight.bold),),
        ],
      ),
      SizedBox(height: 20,),
      Container(
        height: movie_height+50,
        // color: Colors.red,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: top_10_moviesList.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.only(right: 6),
              height: movie_height,
              width: 110,
              
              child: GestureDetector(
                onTap: () {
                  
                      
                    Future getCredits_function (int id) async{
                      
                      Map movieObject = await tmdbWithLogs.v3.movies.getCredits(id);

                      final result = CreditsClass.fromJson(movieObject);
                      final cast_list = result.cast;
                      

                       cast_list.forEach((element) { 
                            // print(element.toJson());
                            final objectName = Cast.fromJson(element.toJson());
                            print(objectName.name);
                            castNames.add(objectName.name);
                            castPhotos.add("http://image.tmdb.org/t/p/w500" + objectName.profilePath!) ;
                            castCharacters.add(objectName.character);
                            

                        });
                        print("castName:");
                            print("castNames " + castNames[0]);

                      
                      // return result;


                    }
                    getDetails_function(int id) async {
                      //  Map genresMap = await tmdbWithLogs.v3.genres.getMovieList();
                      //  List genres = genresMap['genres'];
                       
                       
                        String title =  top_10_moviesList[index]['title'];
                        String imagePath =  "http://image.tmdb.org/t/p/w500"+top_10_moviesList[index]['poster_path'];
                        String rating =  top_10_moviesList[index]['vote_average'];
                        String releaseDate =  top_10_moviesList[index]['release_date'];

                        info_Of_movie.addAll([title, imagePath, rating, releaseDate]);

                        // var genreIds = ;
                        // print("top_10_moviesList[index]['genre_ids']");
                        // switch () {
                        //   case value:
                            
                        //     break;
                        //   default:
                        // }
                        // List<String> genre =  ;
                        
                    }

                    
                    getCredits_function (top_10_moviesList[index]['id']);
                    getDetails_function (top_10_moviesList[index]['id']);
                    // print(castNames);
                    // print(castPhotos);
                    // print(castCharacters);
                    // print(info_Of_movie);
      
                    
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) { return  MoviePage(
                          movieList: top_10_moviesList, 
                          poster_path: top_10_moviesList[index]['poster_path'],
                          title: (top_10_moviesList[index]['title'] != null) ? top_10_moviesList[index]['title'] : top_10_moviesList[index]['release_date'],
                          release_date: top_10_moviesList[index]['release_date'],
                          overView: top_10_moviesList[index]['overview'],
                          ); })
                        );
                    },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: (top_10_moviesList[index]['poster_path'] != null) ? 
                      Image.network("http://image.tmdb.org/t/p/w500"+top_10_moviesList[index]['poster_path'], fit: BoxFit.cover, height: double.infinity, width: 110,)
                      : Text("Loading..")
                      ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: movie_height+50,
                        width: 100,
                        decoration: BoxDecoration( 
                          borderRadius: BorderRadius.circular(10),
                          // gradient: LinearGradient(colors: [Color.fromARGB(95, 136, 135, 135), Colors.transparent])
                        ),
                        child: Stack(
                          
                          children: [
                            Positioned(
                              bottom: 15, 
                              // right: 0,
                              child: Container(
                                // height: 20,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: colors.beguni
                                ),
                                child: Text("  ${top_10_moviesList[index]['vote_average'].toString().substring(0,3)}  ", style: TextStyle(fontSize: 9,color: Colors.white),),
                              ),
                            ),
                            Container(height: movie_height-40,),
                            // (top_10_moviesList[index]['original_title'] != null) ? Container(
                            //   padding: const EdgeInsets.only(left: 5.0),
                            //   width: double.infinity,
                            //   color: Colors.grey.shade200.withOpacity(0.5),
                            //   child:  
                            //   Text("${top_10_moviesList[index]['original_title']}", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 13),maxLines: 3, softWrap: true)
                            //   ,
                            // ): Text(""),
                          ],
                        ),
                      )
                      ),
                  ],
                ),
              ),
            );
          }
          ),
      ),
    ],
  );


}
}