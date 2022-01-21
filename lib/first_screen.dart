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
      body: SingleChildScrollView(
      child: Column(
          children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Text(name + '\n\n' + description + '\n\n' + abv + '°',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white)),
      ),
        Container(
          height: 400,
          padding: const EdgeInsets.all(20.0),
          child: Image.network(image),
        ),
    ]
      ),)
    );
  }
}

//

