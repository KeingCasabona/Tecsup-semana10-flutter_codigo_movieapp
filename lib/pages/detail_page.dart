import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo_movieapp/services/api_service.dart';
import 'package:flutter_codigo_movieapp/ui/general/colors.dart';
import 'package:flutter_codigo_movieapp/ui/widgets/item_cast_widget.dart';
import 'package:flutter_codigo_movieapp/ui/widgets/line_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  int movieId;
  DetailPage({super.key, required this.movieId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ApiService _apiService = ApiService();
  MovieDetailModel? movieDetailMovie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getData() {
    _apiService.getMovie(widget.movieId).then((value) {
      if (value != null) {
        movieDetailMovie = value;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movieId);
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Batman',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kBrandPrimaryColor,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://i.pinimg.com/564x/36/2c/c0/362cc04a562564ce246c4a93627e07c2.jpg',
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
                                  'https://i.pinimg.com/564x/00/3f/d2/003fd2a08013ee388c7fa30b5c2d6420.jpg',
                                  height: 200,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '2022-01-01',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'The Batman fdsfsd f d sf sdfsdfdsfdsfdsf ds fdsfdsfdsfdsf sd fs dfsdf',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                                          '120 min',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
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
                        'PFDSFSDEFSDFDS FDSFDS FDS FDSF',
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
                                'https://www.marvel.com/movies/thor-love-and-thunder');
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
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 2,
                        children: [
                          Chip(
                            label: Text('Crime fdsfdsf'),
                          ),
                          Chip(
                            label: Text('drama'),
                          ),
                          Chip(
                            label: Text('Terror fdsfdsf'),
                          ),
                          Chip(
                            label: Text('crime'),
                          ),
                          Chip(
                            label: Text('Crime fdsfdsf'),
                          ),
                          Chip(
                            label: Text('crime'),
                          ),
                          Chip(
                            label: Text('Crime fdsfdsf'),
                          ),
                          Chip(
                            label: Text('crime'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Cast',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      LineWidget(width: 50),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemCastWidget(),
                            ItemCastWidget(),
                            ItemCastWidget(),
                            ItemCastWidget(),
                            ItemCastWidget(),
                            ItemCastWidget(),
                            ItemCastWidget(),
                          ],
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
      ),
    );
  }
}
