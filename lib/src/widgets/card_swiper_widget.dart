import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_billboard/src/models/movie_model.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<dynamic> movies;

  const CardSwiperWidget({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemCount: movies.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          Movie _movieTemp = movies[index];
          return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(_movieTemp.getPosterImage()),
                fit: BoxFit.cover,
              ));
        },
      ),
    );
  }
}
