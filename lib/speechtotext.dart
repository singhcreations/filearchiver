//text to speech file//

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class YourScreen1 extends StatefulWidget {
  @override
  _YourScreen1State createState() => _YourScreen1State();
}

class _YourScreen1State extends State<YourScreen1> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _words = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
    // _startListening();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {
      _startListening();
    });
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _controller.text = result.recognizedWords;
    setState(() {
      // Navigator.push(
      //   context,
        // MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Speech to Text Demo'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffix: IconButton(
                        onPressed: _speechToText.isListening
                            ? _stopListening
                            : _startListening,
                        icon: Icon(_speechToText.isListening
                            ? Icons.mic_off
                            : Icons.mic),
                      ),
                      hintText: 'Your Spoken Text'),
                )),
            Text(_speechToText.isListening
                ? _words
                : _speechEnabled
                    ? 'Press the Microphone to Start Speech to Text'
                    : 'Speech Not Available'),
          ],
        )));
  }
}
