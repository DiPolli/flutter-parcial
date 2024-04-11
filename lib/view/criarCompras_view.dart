// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CriarComprasView extends StatefulWidget {
  final Function(String) addCompras;

  CriarComprasView({required this.addCompras});

  @override
  _CriarComprasViewState createState() => _CriarComprasViewState();
}

class _CriarComprasViewState extends State<CriarComprasView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicione novas listas:'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 30,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Insira o nome da nova lista',
                  labelStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
                height: 30,
              ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  widget.addCompras(_controller.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}