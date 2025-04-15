import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vela/classes/appbar.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/movieWidget_forserial.dart';
import 'package:vela/screens/movie_page/movie_page.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({ Key? key }) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {


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
      print(newReleasedMovies[15]["id"]);

      });

    

  }

    CustomAppBar customAppBar = CustomAppBar();
  final ColorsList colors = ColorsList();


  List<Widget> listItem = [];

  MovieWidget_ForSerial_Class movieWidget_ForSerial = MovieWidget_ForSerial_Class();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
        
            Container(
              height: 80,
              child: customAppBar.customAppBar("Download", MediaQuery.of(context).size.width),
            ),
        
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(top: 70),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
        
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) { return  MoviePage(); }));
                    },
                    child: movieWidget_ForSerial.movieWidget_ForSerial(MediaQuery.of(context).size.width*(2/5), MediaQuery.of(context).size.width*(3/5)-80, "LightYear", "1h 42m 33s", "6.5/10"));
                }
                ),
            ),
          ],
        ),
      ),
    );
  }
}