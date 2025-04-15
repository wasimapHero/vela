import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vela/classes/movie_grid_movie.dart';
import 'package:vela/classes/movies_pageView.dart';
import 'package:vela/screens/movie_page/movie_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {


  
  List top_10_moviesList = [];
  List trendingMovieslist = [];
  List newReleasedMovies = [];



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
      print("newReleasedMovies[15][id]");
      print(newReleasedMovies[15]["id"]);

      });

    

  }

    final Movie_Grid_Movie_Class movie_Grid_Movie  = Movie_Grid_Movie_Class();


  @override
  Widget build(BuildContext context) {


        var movie_height = MediaQuery.of(context).size.height*(1/3)-22;
        var movie_width = MediaQuery.of(context).size.width*(1/2)-22;


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: movie_Grid_Movie.movie_Grid_Movie(newReleasedMovies, movie_height, movie_width),
        
        ),
    );
  }
}