import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/models/movie_detail_cast.dart';
import 'package:flutter_codigo_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo_movieapp/services/api_service.dart';
import 'package:flutter_codigo_movieapp/ui/general/colors.dart';
import 'package:flutter_codigo_movieapp/ui/widgets/item_cast_widget.dart';
import 'package:flutter_codigo_movieapp/ui/widgets/line_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int movieId;
  const DetailPage({super.key, required this.movieId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ApiService _apiService = ApiService();
  MovieDetailModel? movieDetailMovie;
  MovieDetailCast? movieDetailCast;

  getData() {
    _apiService.getMovie(widget.movieId).then((value) {
      if (value != null) {
        movieDetailMovie = value;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
    fetchMovieCast();
  }

  void fetchMovieDetails() async {
    ApiService apiService = ApiService();
    MovieDetailModel? movie = await apiService.getMovie(widget.movieId);
    setState(() {
      movieDetailMovie = movie;
    });
  }

  void fetchMovieCast() async {
    ApiService apiService = ApiService();
    MovieDetailCast? cast = await apiService.getMovieCast(widget.movieId);
    setState(() {
      movieDetailCast = cast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandPrimaryColor,
        body: movieDetailMovie == null
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      movieDetailMovie!.originalTitle,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    centerTitle: true,
                    backgroundColor: kBrandPrimaryColor,
                    expandedHeight: 220,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${movieDetailMovie!.backdropPath}',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  kBrandPrimaryColor.withOpacity(0.5),
                                  kBrandSecondaryColor.withOpacity(0.001),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    pinned: true,
                    floating: true,
                    snap: false,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movieDetailMovie!.posterPath}',
                                          height: 200,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movieDetailMovie!.originalTitle,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.date_range,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  movieDetailMovie!.releaseDate
                                                      .toString()
                                                      .substring(0, 10),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.timelapse,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  movieDetailMovie!.runtime
                                                          .toString() +
                                                      " min",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overview',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              LineWidget(
                                width: 50,
                              ),
                              SizedBox(height: 4),
                              Text(
                                movieDetailMovie!.overview,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    Uri _uri = Uri.parse(
                                        movieDetailMovie!.homepage.toString());
                                    await launchUrl(_uri);
                                  },
                                  icon: Icon(
                                    Icons.link,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kBrandSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  label: Text(
                                    'Home page',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Genders',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              LineWidget(width: 50),
                              Wrap(
                                //crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.start,
                                spacing: 8,
                                runSpacing: 2,
                                children: movieDetailMovie!.genres
                                    .map((e) => Chip(
                                          label: Text(
                                            e.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: kBrandPrimaryColor,
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Cast',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              LineWidget(width: 50),
                              movieDetailCast == null
                                  ? Center(child: CircularProgressIndicator())
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: movieDetailCast!.cast
                                            .where((castMember) =>
                                                castMember.profilePath != null)
                                            .map((castMember) {
                                          return Column(
                                            children: [
                                              ItemCastWidget(
                                                profilePath:
                                                    castMember.profilePath,
                                                name: castMember.name,
                                              ),
                                              SizedBox(height: 8),
                                              Container(
                                                width: 90,
                                                child: Text(
                                                  castMember.character ?? '',
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                              SizedBox(height: 140),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
