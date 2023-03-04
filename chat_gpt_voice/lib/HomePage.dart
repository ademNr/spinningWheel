import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speaking";
  var isListening = false;

  @override
  void initState() {
    super.initState();
// Request audio recording permission before initializing the speechToText object
    speechToText.initialize(onStatus: (status) {
      print('status: $status');
    }, onError: (error) {
      print('error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: Duration(milliseconds: 500),
        glowColor: Color.fromARGB(255, 0, 128, 255),
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize(
                onStatus: (status) {
                  print('status: $status');
                },
                onError: (error) {
                  print('error: $error');
                },
              );
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 35,
            child: Icon(Icons.mic),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Icon(
          Icons.south_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Speech to Voice',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: EdgeInsets.only(bottom: 150),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}