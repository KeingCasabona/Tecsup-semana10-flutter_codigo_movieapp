import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/ui/widget/item_movie_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];

  getMovies() async {
    String _url =
        'https://api.themoviedb.org/3/movie/popular?api_key=b75b5deb55a09c7f29e699ae08cd4be5&language=en-US&page=1';
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      Map<String, dynamic> moviesMap = json.decode(_response.body);
      movies = moviesMap['results'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getMovies();
    return Scaffold(
      backgroundColor: Color(0xff23232d),
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
