import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMesssage = '';
  final _controller = new TextEditingController();

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    Firestore.instance
        .collection('chat')
        .add({'text': _enteredMesssage, 'timestamp': Timestamp.now()});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Send a message...',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMesssage = value;
                });
              },
              controller: _controller,
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: _enteredMesssage.trim().isEmpty ? null : _sendMessage,
          )
        ],
      ),
    );
  }
}
