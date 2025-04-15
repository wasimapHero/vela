import 'package:flutter/material.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/movies_pageView.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/screens/movie_page/movie_page.dart';

class Movie_Grid_Movie_Class {

    final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();

  

  Widget movie_Grid_Movie (List newReleasedMovies, double movie_height, double movie_width) {
    return    Container(
      height: double.infinity,
      child: CustomScrollView(
          primary: false,
          shrinkWrap: true,
          slivers: [
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            childAspectRatio: (movie_width/movie_height),
                                  crossAxisCount: 2), 
                                  itemCount: newReleasedMovies.length,
          itemBuilder: (BuildContext context, index) {
            return  GestureDetector(
      
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {  
                          return  MoviePage(movieList: [], poster_path: newReleasedMovies[index]['poster_path'],
                          title: newReleasedMovies[index]['title'],
                          release_date: newReleasedMovies[index]['release_date'], overView: newReleasedMovies[index]['overview']
                          ,);
                           }));
            },
            child: Container(
                  // color: const Color.fromRGBO(255, 193, 7, 1),
                  child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network("http://image.tmdb.org/t/p/w500"+newReleasedMovies[index]['poster_path'], 
                fit: BoxFit.cover, height: movie_height, width: movie_width,)),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: movie_height,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: movie_width,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [Color.fromARGB(135, 0, 0, 0), Colors.transparent])
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: colors.golapi
                            ),
                            child: Text("  ${newReleasedMovies[index]['vote_average'].toString().substring(0,3)}  ", style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(width: 50,)
                        ],
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(left:5.0, bottom: 20, right: 10),
                        child: Text("${newReleasedMovies[index]['title']}", style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.w500, fontSize: 13),maxLines: 3, softWrap: true),
                      ),
                    ],
                  ),
                )
                ),
            ],
                  ),
                ),
          ) ;
          }
              )
          ],
        )
    )
    ;

  }
}