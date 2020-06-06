import 'package:flutter/material.dart';
import 'package:tryn/Widgets/Conversations.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chat(),

      )
  );
}

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: new AppBar(
          backgroundColor: Colors.purple,
          title: Text('#Chats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.search, color: Colors.white), onPressed: () {})
          ],
        ),
        body: Container(
          child: ListView(
              children: <Widget>[
                SizedBox(height: 10,),
                Conversation(
                  image: "NU.png",
                  name: "Batch of 2018",
                  msg: "Sarcasm intended",
                  isRead: false,
                ),
                Conversation(
                  image: "cao.jpg",
                  name: "CAO",
                  msg: "Let's do this",
                  isRead: true,
                ),
                Conversation(
                  image: "Irrfan Khan.jpg",
                  name: "Irrfan Khan",
                  msg: "Hey, I am waiting",
                  isRead: false,
                ),
                Conversation(
                  image: "psycho.jpg",
                  name: "Psychology",
                  msg: "It's today only",
                  isRead: true,
                ),
                Conversation(
                  image: "nss.jpg",
                  name: "NSS",
                  msg: "Happy to help",
                  isRead: false,
                ),
                Conversation(
                  image: "os.png",
                  name: "OS",
                  msg: "Sure",
                  isRead: false,
                ),
                Conversation(
                  image: "girl.jpg",
                  name: "+9186947215",
                  msg: "Sure",
                  isRead: true,
                ),
                Conversation(
                  image: "boy.jpg",
                  name: "Amit",
                  msg: "I will call you tomorrow",
                  isRead: false,
                ),
                Conversation(
                  image: "talf.jpg",
                  name: "TALF",
                  msg: "Okay sir",
                  isRead: true,
                ),
               Conversation(
                image: "write.jpg",
                name: "WriteSoft",
                msg: "I have submitted my work",
                isRead: true,
                ),
          ],
        )
      ),
    );
  }
}


