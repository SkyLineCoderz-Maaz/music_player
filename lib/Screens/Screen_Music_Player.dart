import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool playing = false;
  IconData playButton = Icons.play_arrow;
  late AudioPlayer player;
  late AudioCache cache;
  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value){
        seekToSec(value.toInt());
        }
    );
  }
  void seekToSec(int sec){
    Duration newPos=Duration(seconds: sec);
    player.seek(newPos);
  }
  @override
  void  initState(){
    super.initState();
    player=AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 48, left: 12),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Music Beats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Listen to your favourite Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 29,
                ),
                Center(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3.5,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: Image.asset(
                      "assets/images/SL-123119-26540-05.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    "Ringtone",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 3,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            slider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    iconSize: 45.0,
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(Icons.skip_previous_sharp)),
                                IconButton(
                                  iconSize: 62.0,
                                  color: Colors.blue,
                                  onPressed: () {
                                    if (!playing) {
                                      setState(() {
                                        playButton = Icons.pause;
                                        playing = true;
                                      });
                                    } else {
                                      setState(() {
                                        playButton = Icons.play_arrow;
                                        playing = false;
                                      });
                                    }
                                  },
                                  icon: Icon(playButton),),
                                IconButton(
                                    iconSize: 45.0,
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(Icons.skip_next_sharp)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
