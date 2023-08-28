import 'package:flutter/material.dart';
import "hover.dart";
import "play_song.dart";

class SongTile extends StatelessWidget{
  const SongTile({super.key, required this.title, required this.artist, required this.duration});
  final String title;
  final String artist;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (isHovered){
        final color = isHovered ? Colors.green : Colors.white;
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => PlaySong(title: title, artist: artist, duration: duration,))
            );
          },
          child: Container(
              height: 100,
              color: color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/web_hi_res_512.png",
                    width: 95,
                  ),
                  const SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style:  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text(artist)
                      ]
                  ),
                  const Spacer(),
                  Text(duration)
                ],
              )
          ),
        );
      }
    );
  }
}