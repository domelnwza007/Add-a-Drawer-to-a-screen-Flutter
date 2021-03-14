import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.green[800], Icons.call, 'CALL'),
        _buildButtonColumn(Colors.green[800], Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.green[700], Icons.share, 'SHARE'),
      ],
      ),
    );
    return MaterialApp(
      title: "Flutter layout demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Genshin Impact'),    
          backgroundColor: Colors.blue,
          
        ),
        
        body: ListView(
          children: [
            Image.asset(
              'lib/img/klee snow.jpg',
              width: 100,
              height: 300,
              // fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
 
        )
      )
    );
  }
  
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Klee Snow',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Text(
              'Character , Element:Fire',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('4 stars'),
    ],
  ),
);
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    '\n this is kwaii in the world',
    softWrap: true,
  ),
);