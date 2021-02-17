import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<dynamic> movies;

  const CardSwiperWidget({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Swiper(
        itemCount: movies.length,
        itemWidth: _screenSize.width * 0.85,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          final _movieTemp = movies[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              'https://picsum.photos/1280/720/?image=$_movieTemp',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
