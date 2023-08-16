import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaySong extends StatefulWidget {
  const PlaySong({super.key, required this.artist, required this.title, required this.duration});

  final String artist;
  final String duration;
  final String title;

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  late AudioPlayer advancedPlayer;
  late String filePath;

  String filePicker(){
    String path = "";

    path = "music/${widget.title.toLowerCase().replaceAll(" ", "_")}.mp3";

    return path;
  }

  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
    filePath = filePicker();
    print(filePath);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight/3,
              child: Container(
                color: Colors.deepPurpleAccent,
              )
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
                  onPressed: ()=>Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white,),
                    onPressed: (){},
                  ),
                ],
              )
          ),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight*0.3,
              height: screenHeight*0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*0.1),
                    Text(widget.title.toUpperCase(), style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(widget.artist, style: GoogleFonts.lato(fontSize: 20, color: Colors.black54)),
                    AdvancedAudioPlayer(advancedPlayer: advancedPlayer, file_path: filePath,),
                  ],
                ),
              )
          ),
          Positioned(
              top: screenHeight*0.1,
              left: (screenWidth-225)/2,
              right: (screenWidth-225)/2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("assets/images/30th.jpg"),
                )
              )
          )
        ],
      )
    );
  }
}
