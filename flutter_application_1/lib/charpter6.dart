import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin img 1'),
      ),
      body: Column(
        children: [
          Image.asset('lib/img/monstad.jpg',height:220,fit: BoxFit.fitWidth,),
          ElevatedButton(
            child: Text('next img 2'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genshin img 2"),
      ),
      body: Column(
        children: [
          Image.asset('lib/img/klee.jpg'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back img 1'),
          ),
        ],
      ),
    );
  }
}