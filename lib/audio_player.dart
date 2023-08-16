import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvancedAudioPlayer extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AdvancedAudioPlayer({super.key, required this.advancedPlayer, required this.file_path});
  final String file_path;

  @override
  State<AdvancedAudioPlayer> createState() => _AdvancedAudioPlayerState();
}

class _AdvancedAudioPlayerState extends State<AdvancedAudioPlayer> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying=false;
  bool isPaused=false;
  bool isLoop=false;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState(){
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((d) { setState(() {
      _duration = d;
    });});
    widget.advancedPlayer.onPositionChanged.listen((p) { setState(() {
      _position = p;
    });});
    print(widget.file_path);
    widget.advancedPlayer.setSourceAsset(widget.file_path);
    widget.advancedPlayer.onPlayerComplete.listen((event){
      setState(() {
        _position = const Duration(seconds: 0);
        isPlaying = false;
      });
    });
  }

  Widget btnStart() {
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon: isPlaying==false?Icon(_icons[0], size: 50, color: Colors.deepPurpleAccent,):Icon(_icons[1], size: 50, color: Colors.deepPurpleAccent,),
        onPressed: (){
          if(!isPlaying){
            widget.advancedPlayer.resume();
            setState(() {
              isPlaying=true;
            });
          }else{
            setState(() {
              isPlaying = false;
            });
            widget.advancedPlayer.pause();
          }
        },
    );
  }

  Widget loadAsset(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          btnStart(),
          startOverBtn(),
          loopBtn(),
        ],
      ),
    );
  }

  void changeToSecond(int second){
    widget.advancedPlayer.seek(Duration(seconds: second));
  }

  Widget slider(){
    return Slider(
      activeColor: Colors.deepPurpleAccent,
      inactiveColor: Colors.black45,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value){
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  Widget startOverBtn(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: const Icon(Icons.loop, size: 35, color: Colors.black45,),
      onPressed: (){
        widget.advancedPlayer.seek(const Duration(seconds:0));
        },
    );
  }

  Widget loopBtn(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isLoop==false?const Icon(Icons.repeat, size: 35, color: Colors.black45,):const Icon(Icons.repeat, size: 35, color: Colors.deepPurpleAccent,),
      onPressed: (){
        if(!isLoop){
          widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isLoop = true;
          });
        }
        else{
          widget.advancedPlayer.setReleaseMode(ReleaseMode.stop);
          setState(() {
            isLoop = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_position.toString().split(".")[0], style: GoogleFonts.lato(fontSize: 16),),
                  Text(_duration.toString().split(".")[0], style: GoogleFonts.lato(fontSize: 16),),
                ],
              ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
