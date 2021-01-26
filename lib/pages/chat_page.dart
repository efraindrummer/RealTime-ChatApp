import 'dart:io';
import 'package:chatpp/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  
  List<ChatMessage> _messages = [
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '12331132', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '1231312', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
  ];

  bool _estaEscribiendo = false;


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
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
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
                  setState(() {
                    if(texto.trim().length > 0){
                      _estaEscribiendo = true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
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
                onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text.trim()) : null,
              ) : Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.send),
                    onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text.trim()) : null,
                  ),
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

    final newMessage = new ChatMessage(uid: '123', texto: texto);
    _messages.insert(0, newMessage);

    setState(() {
      _estaEscribiendo = false;
    });
  }
}