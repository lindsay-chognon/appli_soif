
import 'package:flutter/material.dart';
import 'beer_list.dart';

void main() => runApp(const GithubMemberApp());

class GithubMemberApp extends StatelessWidget {
  const GithubMemberApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste des bières',
      theme: ThemeData(primaryColor: Colors.green.shade100),
      home: const BeerListView(),
    );
  }
}
