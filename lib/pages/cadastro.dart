import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool _passwordVisible = false;
  String nome = '';
  String email = '';
  String password = '';
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
                    'assets/images/Signupbro.png',
                    width: 30, // ajuste conforme necessário
                    height: 30, // ajuste conforme necessário
                  ),
                ),
                TextField(
                  onChanged: (value) => {nome = value},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextField(
                  onChanged: (value) => {email = value},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: UnderlineInputBorder(
                       borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
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
                  height: 50,
                ),
                SizedBox(
                  width: 321.0,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o botão é pressionado
                      if (email != '' && password != '') {
                        print('deu certo!');
                        Navigator.of(context).pushNamed('/home');
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
                      'Criar conta',
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
                      'Cadastrar com o Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 40,
                ),
                 RichText(
              text: TextSpan(
                text: 'Já tem uma conta? ',
                style: TextStyle(color: Colors.black), // Estilo para o texto normal
                children: [
                  TextSpan(
                    text: 'Entre!',
                    style: TextStyle(color: Colors.blue), // Estilo para o texto clicável
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed('/login'); // Navega para a rota /login
                      },
                  ),
                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
