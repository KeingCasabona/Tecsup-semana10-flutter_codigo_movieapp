import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('HOla'),
              backgroundColor: Colors.indigo,
              expandedHeight: 200,
              flexibleSpace: Container(
                color: Colors.black,
              ),
              pinned: true,
              floating: true,
              snap: false,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.redAccent,
                  ),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
