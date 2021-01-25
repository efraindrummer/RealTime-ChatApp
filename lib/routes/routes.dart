

import 'package:chatpp/pages/chat_page.dart';
import 'package:chatpp/pages/loading_page.dart';
import 'package:chatpp/pages/login_page.dart';
import 'package:chatpp/pages/register_page.dart';
import 'package:chatpp/pages/usuarios_page.dart';

import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext context)> appRotes = {

  'usuarios' : (_) => UsuariosPage(),
  'chat'     : (_) => ChatPage(),
  'login'    : (_) => LoginPage(),
  'register' : (_) => RegisterPage(),
  'loading'  : (_) => LoadingPage(),
};