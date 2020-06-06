import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  final String image;
  final String name;
  final String msg;
  final bool isRead;

  const Conversation({Key key, this.image, this.name, this.msg, this.isRead})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: new CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage("Images/$image"),
        ),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text(msg, style: TextStyle(color: Colors.white)),
        trailing: Container(width: 13, height: 15,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: isRead ? Colors.white : Colors.blue
          ),
        )
    );
  }
}
