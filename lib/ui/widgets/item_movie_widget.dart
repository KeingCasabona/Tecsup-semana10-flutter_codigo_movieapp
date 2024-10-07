import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/ui/general/colors.dart';

class ItemMovieWidget extends StatelessWidget {
  const ItemMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.48,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://images.pexels.com/photos/307847/pexels-photo-307847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(14),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff23232d).withOpacity(0.9),
              ),
              child: Center(
                child: Text(
                  '4.2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBrandPrimaryColor.withOpacity(0.9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Lorem ipsu hjhj jfsdfsd fsdfsj fsdfdsj. ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    width: 100,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    'fdsfdsf. fdsfsfsf fdsfsd fds fsdfds fdsfds d f  j lkjk. ljk jlkjl kjlk lk jlj lj llkfdsfdsf. fdsfsfsf fdsfsd fds fsdfds fdsfds d f  j lkjk. ljk jlkjl kjlk lk jlj lj llkfdsfdsf. fdsfsfsf fdsfsd fds fsdfds fdsfds d f  j lkjk. ljk jlkjl kjlk lk jlj lj llkfdsfdsf. fdsfsfsf fdsfsd fds fsdfds fdsfds d f  j lkjk. ljk jlkjl kjlk lk jlj lj llk',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '2022-02-12',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '433',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
