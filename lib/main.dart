import 'package:chatpp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatpp/services/chat_service.dart';
import 'package:chatpp/services/socket_service.dart';
import 'package:chatpp/services/auth_service.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        initialRoute: 'login',
        routes: appRotes,
      ),
    );
  }
}