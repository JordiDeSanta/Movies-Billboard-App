import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      child: Swiper(
        control: new SwiperControl(),
        pagination: new SwiperPagination(),
        itemCount: 3,
        itemWidth: 300.0,
        itemHeight: 300.0,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(),
            child: Image.network(
              'https://picsum.photos/1280/720/?image=$index',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
