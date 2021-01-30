import 'package:chatpp/helpers/mostrar_alerta.dart';
import 'package:chatpp/widgets/boton_azul.dart';
import 'package:chatpp/widgets/custom_input.dart';
import 'package:chatpp/widgets/labels.dart';
import 'package:chatpp/widgets/logo.dart';
import 'package:flutter/material.dart';


import 'package:chatpp/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
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
                Logo(titulo: 'Messenger',),
                _Form(),
                Labels(ruta: 'register', titulo: '¿No tine cuenta?', subtitulo: 'Crea una ahora!'),
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

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
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
            text: 'Ingrese',
            onPressed: authService.autenticando ? null : () async{
              //quitar el teclado en pantalla
              FocusScope.of(context).unfocus();
              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if(loginOk){
                //conectar al socket desde el backend server
                //navegar a la pantalla
                Navigator.pushReplacementNamed(context, 'usuarios');
              }else{
                //mostrar una alerta
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamente');
              }
            },
          )
          
        ],
      ),
    );
  }
}

