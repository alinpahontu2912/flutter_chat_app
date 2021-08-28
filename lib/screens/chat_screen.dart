import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('It starts'),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('/chats/EIqGZGQdXh8ARnOGNybM/messages')
              .snapshots()
              .listen((data) {
            data.documents.forEach((element) {
             print(element['text']);
            });
          });
        },
      ),
    );
  }
}
