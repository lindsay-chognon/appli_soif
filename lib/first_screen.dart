import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirstScreen extends StatelessWidget {
  final String name;
  final String description;
  final String abv;
  final String image;
  const FirstScreen({required this.name, required this.description, required this.abv, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Row(
          children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blueGrey,
          alignment: Alignment.center,
          width: 200,
          child: Text(name + '\n\n' + description + '\n\n' + abv + '°',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white)),
      ),
        Center(
          child: Image.network(image),
        ),
    ]
      )
    );
  }
}

//

