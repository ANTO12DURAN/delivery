import 'package:delivery/src/pages/register/register_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -75,
                child: _circleRegister()
            ),
            Positioned(
                top: 60,
                left: 35,
                child: _textRegister()
            ),
            Positioned(
                top: 46,
                left: 3,
                child: _iconBack()
            ),
            Container(
             width: double.infinity,
             margin: EdgeInsets.only(
               top: 150,

             ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    SizedBox(height: 30),
                    _textFieldCorreo(),
                    _textFieldNombre(),
                    _textFieldApellido(),
                    _textFieldTelefono(),
                    _textFieldContrasena(),
                    _textFieldConfirmaContrasena(),
                    _BotonRegistar()
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  Widget _circleRegister(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(100),
          color: MyColors.primaryColor
      ),
    );
  }
  
  Widget _iconBack(){
    return IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back_ios,
        color: Colors.white,
        ),
    );
  }
  Widget _imageUser(){
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _textRegister(){
    return Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'
      ),
    );
  }
  Widget _textFieldCorreo(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.correoController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.email, color: MyColors.primaryColor,)
        ),
      ),
    );
  }

  Widget _textFieldNombre(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.nombreController,
        decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.person, color: MyColors.primaryColor,)
        ),
      ),
    );
  }
  Widget _textFieldApellido(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.apellidoController,
        decoration: InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.person_outline, color: MyColors.primaryColor,)
        ),
      ),
    );
  }
  Widget _textFieldTelefono(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.telefonoController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Teléfono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor,)
        ),
      ),
    );
  }
  Widget _textFieldContrasena(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.contrasenaController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor,)
        ),
      ),
    );
  }
  Widget _textFieldConfirmaContrasena(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.confirmaContrasenaController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColor
            ),
            prefixIcon: Icon(Icons.lock_outline, color: MyColors.primaryColor,)
        ),
      ),
    );
  }
  Widget _BotonRegistar(){
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: _con.registro,
        child: Text('REGISTRARSE'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }
}
