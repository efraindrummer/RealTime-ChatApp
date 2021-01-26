import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blueAccent,
              maxRadius: 14,
            ),
            SizedBox(height: 3),
            Text('Efrain May', style: TextStyle(color: Colors.black87, fontSize: 12))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => Text('$i'),
                reverse: true,
              )
            ),
            Divider(height: 1),
            Container(
              //caja de texto
              height: 100,
              color: Colors.white,
            )
          ],
        ),
      )
    );
  }
}