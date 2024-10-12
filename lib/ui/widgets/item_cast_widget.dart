import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  final String? profilePath;
  final String name;

  const ItemCastWidget({
    super.key,
    this.profilePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      width: 90,
      child: Column(
        children: [
          if (profilePath != null)
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white12,
              backgroundImage:
                  NetworkImage("https://image.tmdb.org/t/p/w200$profilePath"),
            ),
          SizedBox(height: 8.0),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
