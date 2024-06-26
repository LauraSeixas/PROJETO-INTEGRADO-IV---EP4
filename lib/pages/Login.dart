import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importe o pacote http
import 'dart:convert'; // Importe o pacote convert para trabalhar com JSON

import 'package:projeto/pages/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  String email = '';
  String password = '';
  Future<void> _login() async {
    final url = Uri.parse(
        'http://localhost:3000/v0/singin'); // Substitua pela sua URL de login

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      // Se a requisição for bem-sucedida
      Navigator.of(context).pushNamed('/home');
    } else {
      // Se a requisição falhar
      print('Erro: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MindDoc+',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0),
                ),
                SizedBox(
                  width: 320.0,
                  height: 320.0,
                  child: Image.asset(
                    'assets/images/Mobilelogincuate.png',
                    width: 30, // ajuste conforme necessário
                    height: 30, // ajuste conforme necessário
                  ),
                ),
                TextField(
                  onChanged: (value) => {email = value},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) => {password = value},
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _passwordVisible ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Esqueceu Senha?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 321.0,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (email != '' && password != '') {
                        _login(); // Chama a função de login
                      } else {
                        print('errado');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Define o raio da borda do botão
                      ),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130.0,
                        height: 1.0,
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("ou"),
                      ),
                      SizedBox(
                        width: 130.0,
                        height: 1.0,
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 321.0,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Ação a ser executada quando o botão é pressionado
                      print('entrei pelo google');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFCCCCCC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Define o raio da borda do botão
                      ),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
                    label: Text(
                      'Continuar com o Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
