import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'song_tile.dart';

import 'package:flutter/services.dart';

class MusicRecs extends StatefulWidget {
  const MusicRecs({super.key, required this.title, required this.options});

  final String title;
  final Map options;

  @override
  State<MusicRecs> createState() => _MusicRecsState();
}

class _MusicRecsState extends State<MusicRecs> {
  List _songs = [];
  final List _display = [];

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/songs.json');
    final data = await jsonDecode(response);
    List checks = [];
    Map options = widget.options;
    for(var key in options.keys){
      if(options[key]==true){
        checks.add(key);
      }
    }
    setState(() {
      _songs = data["songs"];
      for(var song in _songs){
        for(var tag in checks){
          if(song['Tag']==tag){
            _display.add(song);
          }
        }
      }
    });
  }

  @override
  void  initState(){
    readJson().then((value){
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 45, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for(var item in _display) SongTile(title:item["Song"], artist:item["Artist"], duration:item["Duration"])
            ],
          ),
        )
      ),
      );
  }
}