import 'package:flutter/material.dart';
import 'package:music_player/Screens/Screen_Music_Player.dart';
void main(){
  runApp(MusicApp());
}
class MusicApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}
