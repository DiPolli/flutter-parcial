// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prova/model/cadastro.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Cadastro> listaCadastros = ModalRoute.of(context)!.settings.arguments as List<Cadastro>;

    return Scaffold(
      backgroundColor: Color.fromARGB(150, 39, 39, 39),
      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 69, 122, 165),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(fontSize: 22, color: Color.fromRGBO(214, 214, 214, 1)),
              decoration: InputDecoration(
                labelText: 'Seu Nome',
                labelStyle: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: txtEmail,
              style: TextStyle(fontSize: 22, color: Color.fromRGBO(214, 214, 214, 1)),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: txtSenha,
              style: TextStyle(fontSize: 22, color: Color.fromRGBO(214, 214, 214, 1)),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 22),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                if (txtNome.text.isNotEmpty && txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty) {
                  setState(() {
                    listaCadastros.add(Cadastro(txtNome.text, txtEmail.text, txtSenha.text));
                    Navigator.pop(context);
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Erro ao salvar"),
                        content: Text("Preencha todos os campos."),
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
              child: Text('Confirmar Cadastro', style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7))),
            ),
            
          ],
        ),
      ),
    );
  }
}