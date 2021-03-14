import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*ปรับ 
มีอย่างน้อย 4 items (4 screens)
เปลี่ยนชื่อ item ให้สื่อความหมาย
items ที่ 1 แสดงข้อความ [ชื่อ สกุล รหัสนิสิต]
items ที่ 2 แสดงหน้าจอ รูปภาพแบบ grid [4 rows x2 columns] หรือมากกว่า Create a grid list
items ที่ 3 แสดงหน้าจอ โดยจัด layout  ในรูปแบบใดแบบหนึ่ง Layouts in Flutter - Flutter
items ที่ 4 แสดงหน้าจอ  แสดง video clip

copy code ในไฟล์ main.dart  ใน assignment นี้ 
และส่ง link clip video  แสดง demo ของ output program */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  String _index = 'account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(child: Text('welcome to frist page')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
                title: Row(children: [
                  Icon(Icons.account_box_rounded,
                      color:
                          ((_index == 'account') ? Colors.red : Colors.black)),
                  Text(' Account'),
                ]),
                onTap: () {
                  setState(() {
                    _index = 'account';
                  });
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Account()
                    ));
                }
            ),
            ListTile(
              title: Row(children: [
                Icon(Icons.burst_mode,
                    color: ((_index == 'picture') ? Colors.red : Colors.black)),
                Text(' Picture')
              ]),
              onTap: () {
                setState(() {
                  _index = 'picture';
                });
                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Picturn()
                    ));
              },
            ),
            ListTile(
                title: Row(children: [
                  Icon(Icons.info_rounded,
                      color: ((_index == 'informations')
                          ? Colors.red
                          : Colors.black)),
                  Text(' Informations')
                ]),
                onTap: () {
                  setState(() {
                    _index = 'informations';
                  });
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => Layout()
                    ));
                }),
            ListTile(
                title: Row(children: [
                  Icon(Icons.movie,
                      color: ((_index == 'video') ? Colors.red : Colors.black)),
                  Text(' Video')
                ]),
                onTap: () {
                  setState(() {
                    _index = 'video';
                  });
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen()
                    ));
                }),
            Divider(),
          ],
        ),
      ),
    );
  }
}


//--------------- page Account -------------------
class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Information';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(children: [
              Text("      Name : Mr. Jakkrit Amput"),
              Text("StudentID  : 61022359"),
          ])
        )
      );
  }
}
//------------------page Picturn ------------------
class Picturn extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var title = 'Information';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildGrid()
      );
  }
  Widget _buildGrid() => GridView.count(
    padding: const EdgeInsets.all(2),
    crossAxisCount: 2,
    children: _buildGridTileList(30));

  List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(child: Image.network('https://picsum.photos/250?image=$i')));
}

//-------------------- page Layout ------------------
class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Information';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
            padding: EdgeInsets.all(46.0),
            child: Column(children: [
            Column(children: [
              Row(children : [Image.network('https://picsum.photos/300?image=25')]),
              Row(children: [
                Column(children: [Image.network('https://picsum.photos/150?image=55')],),
                Column(children: [Image.network('https://picsum.photos/150?image=67')],)
              ],)
              ]
            ),
            Column(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  child:Column(children: [
                    Text("Motto",style: TextStyle(fontFamily: 'RobotoMono',fontSize: 25,color: Colors.blueGrey )),
                    Text("coding is pastime,sleep are fultime", style: TextStyle(fontSize: 18))
                  ],)
                  
                  ),
                ),
            ]),
            ]),
        )
      );
  }
}

//------------------ page video ------------------
// cedit 
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
    _controller = VideoPlayerController.asset('video/VALORANT.mp4');
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
        title: Text('Butterfly Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}