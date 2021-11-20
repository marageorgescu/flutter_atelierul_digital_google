import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  HomePage createState() {
    return HomePage();
  }
}

class HomePage extends State<MyHomePage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/salut.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'salut',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/salut_germana.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'salut (Germana)',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/manumesc.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'ma numesc',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/manumesc_germana.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'ma numesc (Germana)',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/cumesti.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'cum esti?',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/cumesti_germana.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'cum esti? (Germana)',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/suntbine.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'sunt bine',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  audioPlayer.open(
                    Audio('assets/sound/suntbine_germana.mp3'),
                  );
                },
                child: const Center(
                  child: Text(
                    'sunt bine (Germana)',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
