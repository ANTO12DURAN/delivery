import 'package:delivery/src/pages/client/products/list/client_products_list_page.dart';
import 'package:delivery/src/pages/login/login_page.dart';
import 'package:delivery/src/pages/register/register_page.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
        'client/products/list' : (BuildContext context) => ClientProductsListPage()
      },
      theme: ThemeData(
        primaryColor: MyColors.primaryColor, //no me quiere funcionar :-(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

