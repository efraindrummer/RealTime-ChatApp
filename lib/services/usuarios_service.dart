import 'package:chatpp/models/usuario.dart';
import 'package:chatpp/models/usuarios_response.dart';
import 'package:chatpp/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chatpp/global/enviroment.dart';

class UsuariosService {

  Future<List<Usuario>> getUsuarios() async {
    
    try {

      final resp = await http.get('${Enviroment.apiUrl}/usuarios', 
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        }
      );

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;

    } catch (e) {
      return [];
    }
  }
}