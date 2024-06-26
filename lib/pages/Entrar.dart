import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntrarPage extends StatefulWidget {
  const EntrarPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EntrarPageState();
  }
}

class EntrarPageState extends State<EntrarPage> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('MindDoc+',
          style: TextStyle(
                  color: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700
                ),
          ),
           SizedBox(height: 20),
          SizedBox(
            width: 320, // Defina a largura desejada para o Container
            height: 320,
            child: Image.asset('assets/images/logoentrar.png'),
          ),
          SizedBox(height: 20),
          SizedBox(
              width: 220.0,
              child: Text(
                'Encontre um médico & marque uma consulta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              )),
          SizedBox(height: 40),
          SizedBox(
            width: 260.0,
            height: 50, // Altura desejada do botão
            child: ElevatedButton(
              onPressed: () {
                // Ação a ser executada quando o botão é pressionado
                Navigator.of(context).pushNamed('/Login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF263238),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Define o raio da borda do botão
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Cor do texto do botão
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 260.0,
            height: 50, // Altura desejada do botão
            child: ElevatedButton(
              onPressed: () {
                // Ação a ser executada quando o botão é pressionado
                Navigator.of(context).pushNamed('/Cadastro');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCBCBC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Define o raio da borda do botão
                ),
              ),
              child: Text(
                'Cadastrar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
