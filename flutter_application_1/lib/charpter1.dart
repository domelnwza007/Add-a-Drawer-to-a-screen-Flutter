import 'package:flutter/material.dart';


void main()=> runApp(MyApp());
// void main(){
//   runApp(MyApp());
//   //เริ่มต้นการรันแอป ด้วยคำสั่งนี้เสมอ
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Inazu babwa",
      home : Scaffold(
        appBar : AppBar(
          title : Text('Hello LnwZa007 HAHA masdasdsadsadsada'),
          centerTitle: true,
          backgroundColor: Colors.pink[200],
        ),
        body : Center(
          // child: Image.asset('lib/img/klee.jpg',height: 100,width: 100,),
          // ignore: deprecated_member_use
          child: RaisedButton.icon(
          onPressed: (){
            print('inazu babwa !!');
            },
          //   // child: Text('click'),
            icon : Icon(Icons.access_alarm),
            label : Text('Alarm !'),
            color: Colors.red,
          )
        )
      )
    );
  }
}
/* chapter 1
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'welcome to flutter',
      home : Scaffold(
        appBar : AppBar(
          title : Text('welcome to dart')
        ),
        body : Center(
          //child : Text('Hello', style : TextStyle() ,),
          child : Image(
            image: NetworkImage(
              'https://miro.medium.com/max/11400/1*lS9ZqdEGZrRiTcL1JUgt9w.jpeg'
            ),
          )
        )
      )
    );
  }
}
//พิมพ์ st แล้วเลือกอันที่ 2
*/