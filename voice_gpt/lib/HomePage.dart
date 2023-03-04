import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_gpt/ApiServices.dart';
import 'package:voice_gpt/chatModel.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speaking";
  var isListening = false;
  final List<ChatMessage>messages = [];
  var scrollController = ScrollController();
  scrollMethod(){
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);
  }

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
          onTapUp: (details)  async {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
            messages.add(ChatMessage(text: text, type: ChatMessageType.user));
            var msg = await ApiService.sendMessage(text);
            setState(() {
              messages.add(ChatMessage(text: msg, type:ChatMessageType.bot));
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.teal.withOpacity(0.9),
            radius: 35,
            child:const  Icon(Icons.mic, color: Colors.white,size: 30,),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade700,
        leading: Image.asset("lib/assets/chatgpt.png", scale:2,color: Colors.white,),
        centerTitle: true,
        title: Text(
          'AdemNr Assistant',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(

        child: Column(
          children: [


            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(

                    color: Colors.black.withOpacity(0.9),
                  ),

                  child: ListView.builder(
                    physics: const  BouncingScrollPhysics(),
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount:  messages.length,
                      itemBuilder: (BuildContext context, int index){
                      var chat = messages[index];
                      return chatBubble(
                        chattext: chat.text,
                        type: chat.type
                      );
                      }
                  ),

                )
            )
          ],
        ),
      ),
    );
  }



  Widget chatBubble({required chattext , required ChatMessageType? type}){
       return Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CircleAvatar(
             backgroundColor: Colors.teal,
             child: type == ChatMessageType.bot ? Image.asset("lib/assets/chatgpt.png", color: Colors.white,scale: 2,) :const  Icon(Icons.person, color: Colors.white, size: 30,),
           ),
         SizedBox(width: 15,),
         Expanded(
           child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
            color:type==ChatMessageType.bot ? Colors.teal.shade800 : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
            ),
            child: Text(
            "${chattext}",
            style: TextStyle(
                color: type == ChatMessageType.bot ? Colors.white : Colors.black, fontSize: 15, fontWeight: FontWeight.w400
            ),
            ),

    ),
         ),
         ],
       );
  }
}

