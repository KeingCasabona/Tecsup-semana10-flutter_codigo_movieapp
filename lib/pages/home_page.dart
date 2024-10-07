import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/models/movile.model.dart';
import 'package:flutter_codigo_movieapp/services/api_service.dart';
import 'package:flutter_codigo_movieapp/ui/general/colors.dart';
import 'package:flutter_codigo_movieapp/ui/widgets/item_movie_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> movies = [];
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() {
    ApiService _apiService = ApiService();
    _apiService.getMovies().then((value) {
      movies = value;
      setState(() {});
    });
  }

  // getMovies() async {
  //   String _url =
  //       '$pathProduction/movie/popular?api_key=$apiKey&language=en-US&page=1';
  //   Uri _uri = Uri.parse(_url);
  //   http.Response _response = await http.get(_uri);
  //   if (_response.statusCode == 200) {
  //     Map<String, dynamic> moviesMap = json.decode(_response.body);
  //     movies = moviesMap['results']
  //         .map<MovieModel>((e) => MovieModel.fromJson(e))
  //         .toList();
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Keing L.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Discover',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    )
                  ],
                ),
              ),

              //seccion de categorias
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieWidget();
                  },
                ),
              ),

              //seccion de listado de peliculas
            ],
          ),
        ),
      ),
    );
  }
}
