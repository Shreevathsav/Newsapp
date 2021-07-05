import 'package:flutter/material.dart';
import 'SingleItemChatUserPage.dart';

class HloChat extends StatefulWidget {
  @override
  _HloChatState createState() => _HloChatState();
}

class _HloChatState extends State<HloChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
              return SingleItemChatUserPage();
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }
}
