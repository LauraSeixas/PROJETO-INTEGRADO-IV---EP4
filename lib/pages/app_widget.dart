import 'package:flutter/material.dart';
import 'package:projeto/pages/Entrar.dart';
import 'package:projeto/pages/Home.dart';

import 'package:projeto/pages/Login.dart';
import 'package:projeto/pages/cadastro.dart';

class AppWinget extends StatelessWidget {
  const AppWinget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/':(context)=> const EntrarPage(),
          '/Login': (context)=> const LoginPage(),
          '/Cadastro':(context)=> const CadastroPage(),
          '/home':(context)=> const HomePage(),
        },
    );
  }
}