import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//import 'package:video_player/video_player.dart';
import 'package:videos_player/videos_player.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';

import 'package:videos_player/model/control.model.dart';

main() => runApp(MyApp());
final assetsAudioPlayer = AssetsAudioPlayer();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 200,
              width: double.infinity,
              child: Card(
                color: Colors.amberAccent,
                child: Image.asset('assets/image.jpg'),
                elevation: 5,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Internet >',
                    style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.orangeAccent),
                    child: IconButton(
                        icon: Icon(Icons.music_note),
                        onPressed: () async {
                          try {
                            await assetsAudioPlayer.open(
                              Audio.network(
                                  "https://github.com/Nirav44/flutter_test/blob/master/sajni.mp3"),
                            );
                          } catch (t) {
                            //mp3 unreachable
                          }
                        }),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.orangeAccent),
                    child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          assetsAudioPlayer.open(
                            Audio(
                              "assets/audios/sajni.mp3",
                            ),
                          );
                        }),
                  ),
                  Text(
                    ' < by assets',
                    style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Card(
                  color: Colors.white,
                  child: VideosPlayer(
                    networkVideos: [
                      new NetworkVideo(
                        id: "2",
                        name: "Amin",
                        videoUrl:
                            "http://github.com/Nirav44/flutter_test/raw/master/Dubstep%20Bird%20(Original%205%20Sec%20Video).mp4",
                        videoControl: new NetworkVideoControl(
                          fullScreenByDefault: true,
                        ),
                      ),
                    ],
                    playlistStyle: Style.Style2,
                  ),
                ),
              ),
            ),
            Text(
              'video player',
              style: TextStyle(fontFamily: 'RobotoMono'),
            )
          ],
        ),
      ),
    );
  }
}
