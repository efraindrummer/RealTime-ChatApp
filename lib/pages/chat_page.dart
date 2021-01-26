import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

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
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      )
    );
  }

  Widget _inputChat(){
    
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  //cuando hay un valor para poder enviar  el mensaje
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              ),
            ),
            //Boton de enviar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed: null
              ) : Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.blue[400]),
                  onPressed: (){},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto){
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
  }
}