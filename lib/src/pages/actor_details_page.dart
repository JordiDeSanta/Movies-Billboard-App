import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/actor_model.dart';

class ActorDetails extends StatelessWidget {
  const ActorDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Actor actor = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Actor Details'),
        centerTitle: true,
      ),
      body: _createActorDetails(context, actor),
    );
  }

  Widget _createActorDetails(BuildContext context, Actor a) {
    return _createActorCard(context, a);
  }

  Widget _createActorCard(BuildContext context, Actor a) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 250.0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              width: 150,
              height: 250.0,
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage(a.getPhoto()),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 90),
                Text(
                  a.name,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'as ' + a.character,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
