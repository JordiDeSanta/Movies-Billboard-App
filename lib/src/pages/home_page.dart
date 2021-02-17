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
              SizedBox(height: 20),
              CardSwiperWidget(),
            ],
          ),
        ));
  }
}
