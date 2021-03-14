import 'package:flutter/material.dart';


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demoss',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Change to buildColumn() for the other column example
        body: Column(children: [
              Expanded(
                child: buildRow(),
              ),
              Expanded(
                child: buildColumn(),
              ),
            ],),
      ),
    );
  }
  Widget buildRow() =>
      // #docregion Row
      Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(
      child: Image.asset('lib/img/klee snow.jpg'),
    ),
    Expanded(
      child: Image.asset('lib/img/klee.jpg'),
    ),
    Expanded(
      child: Image.asset('lib/img/monstad.jpg'),
    ),
  ],
);
  Widget buildColumn() =>
      // #docregion Column
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/img/klee snow.jpg',height: 50,width: 50),
          Image.asset('lib/img/klee.jpg',height: 50,width: 50),
          Image.asset('lib/img/monstad.jpg',height: 50,width: 50),
        ],
      );
      // #enddocregion Column
}
