import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaySong extends StatefulWidget {
  const PlaySong({super.key, required this.artist, required this.title, required this.duration});

  final String artist;
  final String duration;
  final String title;

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  @override
  Widget build(BuildContext context) {
    final double screenHieght = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHieght/3,
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
                  onPressed: (){},
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
              top: screenHieght*0.3,
              height: screenHieght*0.3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHieght*0.1),
                    Text(widget.title.toUpperCase(), style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(widget.artist, style: GoogleFonts.lato(fontSize: 20, color: Colors.black54))
                  ],
                ),
              )
          ),
          Positioned(
              top: screenHieght*0.12,
              left: (screenWidth-225)/2,
              right: (screenWidth-225)/2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network("https://prodimage.images-bn.com/pimages/0888751209411_p0_v2_s1200x630.jpg"),
                )
              )
          )
        ],
      )
    );
  }
}
