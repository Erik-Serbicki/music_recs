import 'package:flutter/material.dart';
import "hover.dart";

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
        return Container(
            height: 100,
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "https://prodimage.images-bn.com/pimages/0888751209411_p0_v2_s1200x630.jpg",
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
        );
      }
    );
  }
}