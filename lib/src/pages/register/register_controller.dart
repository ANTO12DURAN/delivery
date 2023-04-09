import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/users_provide.dart';
import 'package:flutter/material.dart';

class RegisterController{

    BuildContext? context;
    TextEditingController correoController = TextEditingController();
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController telefonoController = TextEditingController();
    TextEditingController contrasenaController = TextEditingController();
    TextEditingController confirmaContrasenaController = TextEditingController();

    UserProvider userProvider = UserProvider();

    Future? init(BuildContext context){
      this.context = context;
      userProvider.init(context);
    }

    void registro() async {
      String correo = correoController.text.trim();
      String nombre = nombreController.text;
      String apellido = apellidoController.text;
      String telefono = telefonoController.text.trim();
      String contrasena = contrasenaController.text.trim();
      String confirmaContrasena = confirmaContrasenaController.text.trim();


      User user = User(
          email: correo,
          name: nombre,
          lastname: apellido,
          phone: telefono,
          password: contrasena
      );


      ResponseApi? responseApi = await userProvider.create(user);

      print('RESPUESTA: ${responseApi?.toJson()}');
      print(correo);
      print(nombre);
      print(apellido);
      print(telefono);
      print(contrasena);
      print(confirmaContrasena);
    }
}