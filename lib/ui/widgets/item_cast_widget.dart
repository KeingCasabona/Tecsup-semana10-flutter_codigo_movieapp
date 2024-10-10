import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  const ItemCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white12,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/6899782/pexels-photo-6899782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          Text(
            'Betty Gonzales del Prado',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            'Actriz de reparto',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
