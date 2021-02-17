import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<dynamic> movies;

  const CardSwiperWidget({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Swiper(
        itemCount: 5,
        itemWidth: 300.0,
        itemHeight: 300.0,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          final _movieTemp = movies[index];
          return Card(
            shape: RoundedRectangleBorder(),
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
