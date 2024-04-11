import 'package:flutter/material.dart';
import 'package:flutter_prova/model/Compras.dart';
import 'package:flutter_prova/model/Item.dart';

class CriarItensView extends StatefulWidget {
  final Compras listaCompras;

  CriarItensView({required this.listaCompras});

  @override
  _CriarItensViewState createState() => _CriarItensViewState();
}

class _CriarItensViewState extends State<CriarItensView> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController qtdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Novo Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Item'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: qtdController,
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty && qtdController.text.isNotEmpty) {
                  final String nomeItem = nomeController.text;
                  final int quantidadeItem = int.parse(qtdController.text);
                  final Item novoItem = Item(nome: nomeItem, quantidade: quantidadeItem);
                  widget.listaCompras.itens.add(novoItem);
                  Navigator.popUntil(context, ModalRoute.withName('principal'));
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