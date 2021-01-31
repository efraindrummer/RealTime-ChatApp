import 'package:chatpp/helpers/mostrar_alerta.dart';
import 'package:chatpp/services/auth_service.dart';
import 'package:chatpp/services/socket_service.dart';
import 'package:chatpp/widgets/boton_azul.dart';
import 'package:chatpp/widgets/custom_input.dart';
import 'package:chatpp/widgets/labels.dart';
import 'package:chatpp/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'Registro',),
                _Form(),
                SizedBox(height: 10,),
                Labels(ruta: 'login', titulo: '¿Ya tiene cuenta?', subtitulo: 'Ingresa ahora!',),
                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,

          ),
          
          BotonAzul(
            text: 'Crear cuenta',
            onPressed: authService.autenticando ? null : () async {
              //quitar el teclado en pantalla
              FocusScope.of(context).unfocus();

              print(nameCtrl.text);
              print(emailCtrl.text);
              print(passCtrl.text);

              final registroOk =await authService.register(nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());

              if(registroOk == true){
                //conectar con el backend socket server
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              }else{
                mostrarAlerta(context, 'Registro Incorrecto', registroOk);
              }

            },
          )
          
        ],
      ),
    );
  }
}

