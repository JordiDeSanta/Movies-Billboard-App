import 'package:flutter/material.dart';
import 'package:movie_billboard/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
            children: [
              _swiperCreator(),
            ],
          ),
        ));
  }
}

Widget _swiperCreator() {
  return CardSwiperWidget(
    movies: [11, 22, 33, 44, 55],
  );
}
