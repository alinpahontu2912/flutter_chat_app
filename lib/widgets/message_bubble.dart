import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  final String username;
  final String userImage;

  MessageBubble(this.message, this.isMe, this.username, this.userImage,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius:
                    isMe ? BorderRadius.circular(0) : BorderRadius.circular(10),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: isMe ? Colors.red : Colors.black,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.red : Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          top: -10,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
        ),
      ],
    );
  }
}
