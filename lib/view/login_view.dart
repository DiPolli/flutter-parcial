// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prova/model/cadastro.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  List<Cadastro> listaCadastros = [
    Cadastro('Administrador', 'admin@admin', 'admin'),
    Cadastro('Pedro', 'Pedro@gmail.com', '1234'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(150, 39, 39, 39),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 166, 168, 170),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),

            Image.asset(
              'lib/images/login.png',
              width: 300, 
              height: 200, 
            ),
            SizedBox(
              height: 40,
            ),

            TextField(
              controller: txtEmail,
              style: TextStyle(fontSize: 22, color: Color.fromRGBO(214, 214, 214, 1)),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            TextField(
              controller: txtSenha,
              style: TextStyle(fontSize: 22, color: Color.fromRGBO(214, 214, 214, 1)),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                if (txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty) {
                  realizarLogin();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Erro ao conectar"),
                        content: Text("Verifique os dados e tente novamente."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 12),
                    textStyle: TextStyle(fontSize: 20),
                ),
              child: Text('Login', style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7))),
            ),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cadastro', arguments: listaCadastros);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 12),
                    textStyle: TextStyle(fontSize: 20),
                ),
              child: Text('Cadastre', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            ),

          ],
        ),
      ),
    );
  }

  void realizarLogin() {
    String email = txtEmail.text;
    String senha = txtSenha.text;

    for (Cadastro cadastro in listaCadastros) {
      if (cadastro.email == email && cadastro.senha == senha) {
        Navigator.pushReplacementNamed(context, 'principal', arguments: cadastro.nome);
        return;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro ao conectar"),
          content: Text("Verifique os dados e tente novamente."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

}