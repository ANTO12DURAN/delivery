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

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
    User user = User.fromJson(await _sharedPref!.read('user')!);
    print('Usuario: ${user.toJson()}');

    if(user?.sessionToken != null){
        Navigator.pushNamedAndRemoveUntil(
            context, 'client/products/list', (route) => false);
    }
  }

  void goToRegisterPage(){
    Navigator.pushNamed(context!, 'register');
  }


  void login() async {
    String? correo = correoController.text.trim();
    String? contrasena = contrasenaController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(correo, contrasena);
    MySnackbar.show(context!, responseApi!.message);


    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi!.toJson()}');

    if (responseApi!.success!) {
        User user = User.fromJson(responseApi.data);
        _sharedPref?.save('user', user.toJson());
        Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
    } else{
      MySnackbar.show(context!, responseApi!.message);
    }

    print('correo: $correo');
    print('contraseña: $contrasena');
  }


}
//NULL SAFETY