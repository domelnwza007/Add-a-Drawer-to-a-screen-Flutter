import 'package:flutter/material.dart';


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demoss',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demoa'),
        ),
        // Change to buildColumn() for the other column example
        body: Column(children: [
              Expanded(
                child: pic(),
              ),
              Expanded(
                child: IconRow(),
              ),
            ],),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          stars,
          Text(
            '155 views',
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

Widget pic() =>
      // #docregion Row
      Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(
      child: Image.asset('lib/img/klee snow.jpg',height: 125,),
    ),
    Expanded(
      child: Image.asset('lib/img/klee.jpg'),
    ),
    Expanded(
      child: Image.asset('lib/img/monstad.jpg'),
    ),
  ],
);