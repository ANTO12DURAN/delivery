import 'package:delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key? key}) : super(key: key);

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {

  ClientProductsListController _con = new ClientProductsListController();

  @override
  void initState(){

    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(),
      ),
      drawer: _drawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar sesión'),
        ),
      ),
    );
  }

  Widget _menuDrawer(){
    return GestureDetector(
       onTap: _con.openDrawer,
       child: Container(
         margin: EdgeInsets.only(left: 20),
         alignment: Alignment.centerLeft,
         child: Icon(Icons.menu),
       ),
    );

      //IconButton(
      //  onPressed: (){},
      //  icon: Icon(Icons.menu));
  }

  Widget _drawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre de usuario',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
                maxLines: 1,
              ),
              Text(
                'Telefono',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                ),
                maxLines: 1,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(top: 10),
                child: FadeInImage(
                  image: AssetImage('assets/img/no-image.png'),
                  fit: BoxFit.contain,
                  fadeInDuration: Duration(microseconds: 50),
                  placeholder: AssetImage('assets/img/no-image.png'),
                ),
              )
            ],
          )),

          ListTile(
            title: Text('Editar perfil'),
            trailing: Icon(Icons.edit_outlined), //icono para la izquierda
          //  leading: Icon(Icons.cancel), //icono para la derecha
          ),
          ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined), //icono para la izquierda
            //  leading: Icon(Icons.cancel), //icono para la derecha
          ),
          ListTile(
            title: Text('Seleccionar rol'),
            trailing: Icon(Icons.person_outline), //icono para la izquierda
            //  leading: Icon(Icons.cancel), //icono para la derecha
          ),
          ListTile(
            onTap: _con.logout,
            title: Text('Cerrar sesion'),
            trailing: Icon(Icons.power_settings_new), //icono para la izquierda
            //  leading: Icon(Icons.cancel), //icono para la derecha
          )


        ],
      )
    );
  }
}
