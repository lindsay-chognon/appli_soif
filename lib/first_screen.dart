import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final String name;
  final String description;
  const FirstScreen({required this.name, required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.all(8.0),
        color: Colors.blue[600],
        alignment: Alignment.center,
        child: Text(description,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}

//

