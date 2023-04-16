import 'package:delivery/src/pages/login/login_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('INIT STATE');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
     // print('SCHEDULER BINDING');
      _con.init(context);
    });

  }
  //encapsulamiento
  //String _name; // _privada publica(sin raya al piso)

  @override
  Widget build(BuildContext context) {

   // print('METODO BUILD');

    return Scaffold(

      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleLogin()
            ),
            Positioned(
                top: 60,
                left: 25,
                child: _textLogin()
            ),

            SingleChildScrollView(
              child: Column(
              children: [
                 _imageBanner(),
                 _textFieldCorreo(),
                 _textFieldContrasena(),
                 _BotonIngresar(),
                 _textRowAccount(),
              ],
              ),
            )
          ]
          ),
        ),
      );
  }

  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }
  Widget _textLogin(){
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _imageBanner(){
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.22,
          bottom: MediaQuery.of(context).size.height * 0.15
      ),
      child: Image.asset('assets/img/no-image.png',
        width: 200,
        height: 200,
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
  Widget _BotonIngresar(){
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: _con.login,
        child: Text('INGRESAR'),
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

  Widget _textRowAccount(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No tienes cuenta?',
          style: TextStyle(
              color: MyColors.primaryColor
          ),
        ),
        SizedBox(width: 9),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
          ),
        )
      ],
    );
  }
}
