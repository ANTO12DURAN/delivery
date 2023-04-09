import 'package:flutter/material.dart';

class LoginController{

  BuildContext? context;
  TextEditingController correoController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }
  void goToRegisterPage(){
    Navigator.pushNamed(context!, 'register');
  }

  void login(){
    String correo = correoController.text.trim();
    String contrasena = contrasenaController.text.trim();
    
    print('correo: $correo');
    print('contraseña: $contrasena');
  }
}
//NULL SAFETY