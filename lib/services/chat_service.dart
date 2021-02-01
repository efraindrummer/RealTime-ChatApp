import 'package:chatpp/global/enviroment.dart';
import 'package:chatpp/models/mensajes_response.dart';
import 'package:chatpp/models/usuario.dart';
import 'package:chatpp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {

  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {

    final resp = await http.get('${Enviroment.apiUrl}/mensajes/$usuarioID', 
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    final mensajesResponse = mensajesResponseFromJson(resp.body);

    return mensajesResponse.mensajes;
  }
}