
import 'dart:convert';
import 'package:chatpp/global/enviroment.dart';
import 'package:chatpp/models/login_response.dart';
import 'package:chatpp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  Usuario usuario;
  bool _autenticando = false;

  //get y set
  bool get autenticando => this._autenticando;
  set autenticando(bool valor){
    this._autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {

    this.autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final resp = await http.post('${Enviroment.apiUrl}/login', 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    print(resp.body);
    this.autenticando = false;
    
    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      //guardar el token

      return true;
    }else{

      return false;
    }

  
  }
   
}