import 'package:flutter/material.dart';

import 'package:movie_billboard/src/providers/movies_provider.dart';
import 'package:movie_billboard/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cine Movies'), actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ]),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _swiperCreator(),
              _footer(context),
            ],
          ),
        ));
  }

  Widget _swiperCreator() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiperWidget(movies: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          FutureBuilder(
            future: moviesProvider.getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              snapshot.data?.forEach((p) => print(p.title));
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
