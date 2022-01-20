
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'beer.dart';
import 'first_screen.dart';
import 'dart:math';

class BeerListView extends StatefulWidget {
  const BeerListView({Key? key}) : super(key: key);

  @override
  _BeerListViewState createState() => _BeerListViewState();
}

class _BeerListViewState extends State<BeerListView> {
  final _beers = <Beer>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    Random random = Random();
    int randomNumber = random.nextInt(14) + 1; // from 1 upto 13 included
    var dataUrl = 'https://api.punkapi.com/v2/beers?page=$randomNumber';
    final response = await http.get(Uri.parse(dataUrl));
    setState(() {
      final dataList = json.decode(response.body) as List;
      for (final item in dataList) {
        final name = item['name'] as String? ?? '';
        final image = item['image_url'] as String? ?? '';
        final description = item['description'] as String? ?? '';
        final beer = Beer(name, image, description);
        _beers.add(beer);
      }
    });
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text('${_beers[i].name}', style: _biggerFont),
        trailing: Icon(Icons.keyboard_arrow_right_sharp),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstScreen(name: _beers[i].name, description: _beers[i].description),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_beers[i].image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des bières'),
      ),
      body: ListView.separated(
          itemCount: _beers.length,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    );
  }
}
