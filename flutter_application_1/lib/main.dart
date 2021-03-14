import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Add a Drawer to a screen - Flutter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

//main
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Colors.red[400],),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/bg_cat.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
        'KLEE !!',
        style: TextStyle(
          fontSize: 36,
        ),
      )),
        ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Klee',style: TextStyle(fontSize: 30,color: Colors.black54,),),
              decoration: BoxDecoration(
                color: Colors.red[400],
                // shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage("lib/img/klee.jpg"),
                fit: BoxFit.fill,
              ),
              ),     
            ),
            ListTile(
              title: Row(children: [
                  Icon(Icons.person),
                  Text(' Introduce yourself',style: TextStyle(fontSize: 20),),              
                ]),
              onTap: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Account()
                    ));
              },
            ),
            ListTile(
              title: Row(children: [
                  Icon(Icons.list_alt),
                  Text(' Grid List',style: TextStyle(fontSize: 20),),              
                ]),
              onTap: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Picture()
                    ));
              },
            ),
            ListTile(
              title: Row(children: [
                  Icon(Icons.layers),
                  Text(' Layout',style: TextStyle(fontSize: 20),),              
                ]),
              onTap: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Layout()
                    ));
              },
            ),
            ListTile(
              title: Row(children: [
                  Icon(Icons.video_label),
                  Text(' Video',style: TextStyle(fontSize: 20),),              
                ]),
              onTap: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen()
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//page1-introduce youself
class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Introduce yourself';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red[400],
        ),
        body: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(children: [
              Text("Name : Mr. WEERAPHAT SATAKARN",style: TextStyle(fontSize: 18)),
              Text("StudentID  : 61022393",style: TextStyle(fontSize: 20)),
          ])
        )
      );
  }
}

//page2-grid layout
class Picture extends StatelessWidget {
  List<String> images = [
    'lib/img/klee1.png',
    'lib/img/klee2.jpg',
    'lib/img/klee3.jpg',
    'lib/img/klee4.png',
    'lib/img/klee5.jpg',
    'lib/img/klee6.png',
    'lib/img/klee7.jpg',
    'lib/img/klee8.png',
  ];
  @override
  Widget build(BuildContext context) {
    var title = 'Grid List';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red[400],
        ),
        body: GridView(
        physics:
            BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: images.map((url) {
          return Card(child: Image.asset(url));
        }).toList(),
      ),
      );
  }
}

//page3-layout
class Layout extends StatelessWidget {
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
    var title = 'Layout';
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red[400],
        ),
        body: ListView(
          children: [
            Image.asset(
              'lib/img/klee snow.jpg',
              width: 100,
              height: 300,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
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

//page4-video
class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('lib/video/PV_Klee.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
        backgroundColor: Colors.red[400],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

//ลิ้งวิดิโออธิบาย OUTPUT
//https://www.youtube.com/watch?v=F8xJTJsWowg