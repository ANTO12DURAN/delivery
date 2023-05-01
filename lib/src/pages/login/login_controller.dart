import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/users_provide.dart';
import 'package:delivery/src/utils/my_snackbar.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController{

  BuildContext? context;
  TextEditingController correoController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();

  UserProvider userProvider = new UserProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async{
    this.context = context;
    await userProvider.init(context!);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    
    print('Usuario: ${user.toJson()}');


      if (user.sessionToken != null){
        print('Usuario: ${user.toJson()}');
        Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
      }


  }

  void goToRegisterPage(){
    Navigator.pushNamed(context!, 'register');
  }


  void login() async {
    String? correo = correoController.text.trim();
    String? contrasena = contrasenaController.text.trim();
    ResponseApi? responseApi = await userProvider.login(correo, contrasena);

    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi!.toJson()}');

    if (responseApi!.success!) {
        User user = User.fromJson(responseApi.data);
        _sharedPref.save('user', user.toJson());
        Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
    } else{
      MySnackbar.show(context!, responseApi!.message!);
    }
   // print('correo: $correo');
   // print('contraseña: $contrasena');
  }
}
//NULL SAFETY