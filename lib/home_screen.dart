import 'package:flutter/material.dart';
import 'music_recs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map options = {
    'Anxiety': false,
    'Depression': false,
    'Dementia': false,
    'Hearing' : false,
    'Stress': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: const Text("Select those that apply to you:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),
            CheckboxListTile(
              value: options["Anxiety"],
              onChanged: (val){
                setState(() {
                  options["Anxiety"] = val ?? false;
                });
              },
              activeColor: Colors.deepPurpleAccent,
              title: const Text("Anxiety"),
            ),
            CheckboxListTile(
              value: options["Dementia"],
              onChanged: (val){
                setState(() {
                  options["Dementia"] = val ?? false;
                });
              },
              activeColor: Colors.deepPurpleAccent,
              title: const Text("Dementia"),
            ),
            CheckboxListTile(
              value: options["Depression"],
              onChanged: (val){
                setState(() {
                  options["Depression"] = val ?? false;
                });
              },
              activeColor: Colors.deepPurpleAccent,
              title: const Text("Depression"),
            ),
            CheckboxListTile(
              value: options["Hearing"],
              onChanged: (val){
                setState(() {
                  options["Hearing"] = val ?? false;
                });
              },
              activeColor: Colors.deepPurpleAccent,
              title: const Text("Hearing"),
            ),
            CheckboxListTile(
              value: options["Stress"],
              onChanged: (val){
                setState(() {
                  options["Stress"] = val ?? false;
                });
              },
              activeColor: Colors.deepPurpleAccent,
              title: const Text("Stress"),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextButton(
                    onPressed: (){
                      bool hasContent = false;
                      for(var value in options.values){
                        if(value==true){
                          hasContent = true;
                        }
                      }
                      if(hasContent){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MusicRecs(title: "Playlist Recommendations", options: options,)),
                        );
                      }
                    },
                    child: const Text("Submit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
          ],
        ),
      ),
    );
  }
}