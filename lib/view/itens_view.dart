import 'package:flutter/material.dart';
import 'package:flutter_prova/model/Compras.dart';
import 'package:flutter_prova/view/criarItens_view.dart';

class ItensView extends StatefulWidget {
  final Compras listaCompras;

  ItensView({required this.listaCompras});

  @override
  _ItensViewState createState() => _ItensViewState();
}

class _ItensViewState extends State<ItensView> {
  late List<bool> itemComprado;

  @override
  void initState() {
    super.initState();
    itemComprado = [];
    widget.listaCompras.itens.forEach((item) {
      itemComprado.add(item.check);});  
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listaCompras.nome),
      ),
      body: ListView.builder(
        itemCount: widget.listaCompras.itens.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(widget.listaCompras.itens[index].nome), 
            direction: DismissDirection.endToStart, 
            background: Container(
              color: Color.fromARGB(255, 226, 19, 81),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),

            // apagar da lista
            onDismissed: (direction) {
              setState(() {
                widget.listaCompras.itens.removeAt(index); 
              });
            },
            
            child: CheckboxListTile(
              title: Text(widget.listaCompras.itens[index].nome),
              subtitle: Text('Quantidade: ${widget.listaCompras.itens[index].quantidade.toString()}'),
              value: itemComprado[index],
              onChanged: (bool? value) {
                setState(() {
                  itemComprado[index] = value!;
                  widget.listaCompras.itens[index].check = value;
                });
              },
              secondary: Icon(Icons.assignment_sharp),
            ),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CriarItensView(
                listaCompras: widget.listaCompras,
              ),
            ),
          );
        },
        child: Icon(Icons.assignment_add),
      ),
    );
  }
  
}