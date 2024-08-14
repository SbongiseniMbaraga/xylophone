import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: XylophoneApp(),
        backgroundColor: Colors.black,
      ),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playerFunction(notesNum) async {
    final player = AudioPlayer();
    await player.setSourceAsset('note$notesNum.wav');
    await player.resume();
  }

  Expanded buildKey(theColors, thSounds) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playerFunction(thSounds);
        },
        style: TextButton.styleFrom(
          backgroundColor: theColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          'Click Me',
          style: TextStyle(
            color: theColors,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(Colors.red, 1),
          buildKey(Colors.orange, 2),
          buildKey(Colors.yellowAccent, 3),
          buildKey(Colors.greenAccent, 4),
          buildKey(Colors.green, 5),
          buildKey(Colors.blue, 6),
          buildKey(Colors.purple, 7),
        ],
      ),
    );
  }
}
