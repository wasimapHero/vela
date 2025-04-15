import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/movies_pageView.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/screens/bottomNavBar_other_pages/download_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/explore_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/myList_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/profile_page.dart';
import 'package:vela/screens/movie_page/movie_page.dart';

class Homepage extends StatefulWidget {
const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();
  final Movies_pageView_Class movies_PageView = Movies_pageView_Class();
  

  int selectedIndex = 0;
  List top_10_moviesList = [];
  List trendingMovieslist = [];
  List newReleasedMovies = [];
  List tvList = [];

  String _api_key = "02dddcfb8f0c5af3f18c477c9da516d9";
  final _api_Read_Access_Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmRkZGNmYjhmMGM1YWYzZjE4YzQ3N2M5ZGE1MTZkOSIsInN1YiI6IjY1NjZmZTVkM2Q3NDU0MDEyY2NkNDE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TgpAlu0FhUCjpu9rTgYQDkh_gIBhA12wqAnVLG1a1Ak";


// fetching movie data
    @override
  void initState() {
    // TODO: implement initState
    getAllMovie();
    super.initState();
  }

  void getAllMovie() async {
    TMDB tmdbWithLogs = TMDB(
      ApiKeys(_api_key, _api_Read_Access_Token),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true)
      );

      Map trendingMoviesMap = await tmdbWithLogs.v3.trending.getTrending(timeWindow: TimeWindow.week);
      Map topRatedMoviesMap = await tmdbWithLogs.v3.discover.getMovies();
      Map newReleasedMoviesMap = await tmdbWithLogs.v3.movies.getNowPlaying();
      Map tvMap = await tmdbWithLogs.v3.tv.getLatest();

      print(topRatedMoviesMap['results']);

      setState(() {
        top_10_moviesList = topRatedMoviesMap['results'];
        trendingMovieslist = trendingMoviesMap['results'];
        newReleasedMovies = newReleasedMoviesMap['results'];
        // tvList = tvMap['results'];


      print("top_10_moviesList: ");
      print(top_10_moviesList);
      print(newReleasedMovies[15]["id"]);

      });

    

  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2, offset: Offset(0.0, 0.5))]
                ),
                height: MediaQuery.of(context).size.height/2 -50, width: MediaQuery.of(context).size.width,
              child: Stack(
                children:  [
                  Image.network('http://image.tmdb.org/t/p/w500'+newReleasedMovies[15]['poster_path'], fit: BoxFit.cover, height: double.infinity, width: double.infinity,),
                  Positioned(
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 30, top: 30,),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(colors: [Color.fromARGB(135, 0, 0, 0), Colors.transparent])
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 50, width: MediaQuery.of(context).size.width, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/icons_svg/vela pic logo-01.png", fit: BoxFit.cover, height: double.infinity, width: double.infinity,)
                                ),
                          
                               Row(
                                children: [
                                   SvgPicture.asset("assets/images/icons_svg/search.svg", height: 20, color: Colors.white,),
                                   SizedBox(width: 10,),
                                SvgPicture.asset("assets/images/icons_svg/bell.svg", height: 20, color: Colors.white,),
                                ],
                               )
                            ],
                          )),
                
                         Container(
                          height: MediaQuery.of(context).size.height/5-30, width: MediaQuery.of(context).size.width,
                          child: Container()),
                
                          Container(
                            // color: Colors.red.shade200, 
                            width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${newReleasedMovies[15]['original_title']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                              Text("Animation, Adventure, Fantasy", style: TextStyle(color: Colors.white),),
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute( builder: (context) { return  MoviePage(); }));
                                      },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colors.golapi
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            radius: 8,
                                            backgroundColor: colors.golapi,
                                            child: SvgPicture.asset("assets/images/icons_svg/play.svg", height: 15, color: Colors.white,)),
                                          Text("  Play ", style: TextStyle(color: Colors.white),),
                                        ],
                                      ))),
                
                                      SizedBox(width: 10,),
                      
                                      GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/images/icons_svg/plus.svg", height: 12, color: Colors.white,),
                                          Text("  My List ", style: TextStyle(color: Colors.white)),
                                        ],
                                      ))),
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    )
                    )
                  
                ],
              
                
                )
              ),
              
                
              Container(
                            padding: EdgeInsets.only(left: 20, top: 20, ),
                            margin: EdgeInsets.only(bottom: 10),
                             width: double.infinity,
                          
                          child:  movies_PageView.Movies_pageView_Widget("Top 10 Movies This Week", trendingMovieslist, MediaQuery.of(context).size.height*(1/6)-22)
                          ),
                          
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 20, ),
                            margin: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                          
                          child:  movies_PageView.Movies_pageView_Widget("New Releases", newReleasedMovies, MediaQuery.of(context).size.height*(1/6)-22)
                          )
                
                
            ],
          ),
        ),
      ),
    )

      
    ;
  }
}