import 'package:flutter/material.dart';
import 'package:flutter_prova/model/Item.dart';
import 'package:flutter_prova/model/Compras.dart';
import 'package:flutter_prova/view/criarCompras_view.dart';
import 'package:flutter_prova/view/itens_view.dart';


class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  List<Compras> listasDeCompras = [
    Compras(
      nome: 'Compras da semana',
      itens: [
        Item(nome: 'Arroz 5kg', quantidade: 3),
        Item(nome: 'Feijão 1kg', quantidade: 3),
        Item(nome: 'Carne 1Kg', quantidade: 1),
        Item(nome: 'Biscoito', quantidade: 10),
        Item(nome: 'Gatorade', quantidade: 2),
        Item(nome: 'Pão francês', quantidade: 7),
        Item(nome: 'Laranja', quantidade: 12),
        Item(nome: 'Queijo parmesão', quantidade: 1),
      ],
    ),
    Compras(
      nome: 'Acessórios p/ o computador',
      itens: [
        Item(nome: 'Monitor', quantidade: 1),
        Item(nome: 'Mouse', quantidade: 1),
        Item(nome: 'Teclado', quantidade: 1),
      ],
    ),
  ];

  // funcao pra add nova lista de compras
  void addLista(String nomeLista) {
    setState(() {
      listasDeCompras.add(Compras(nome: nomeLista, itens: []));
    });
  }

  // funcao pra add nova lista de itens dentro da lista de compras
  void addItem(Compras listaDeItens, String nomeItem, int quantidade) {
    setState(() {
      listaDeItens.itens.add(Item(nome: nomeItem, quantidade: quantidade));
    });
  }

  @override
  Widget build(BuildContext context) {
    final nome = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, ${nome ?? ''}!'),
        leading: Icon(Icons.person_2),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 25, 181, 219),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Listas de Compras',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listasDeCompras.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // widget pra apagar a lsita
                    Dismissible(
                      key: Key(listasDeCompras[index].nome),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Color.fromARGB(255, 226, 19, 81),
                        child: Icon(Icons.delete),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                      ),

                      // mostra a lista de compras 
                      child: ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text(listasDeCompras[index].nome),
                        trailing: Icon(Icons.arrow_right),
                        // abre a lista de itens 
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                ItensView(listaCompras: listasDeCompras[index]),
                            ),
                          );
                        },
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Alterar Nome'),
                              content: TextField(
                                controller: TextEditingController(text: listasDeCompras[index].nome),
                                onChanged: (value) {
                                  listasDeCompras[index].nome = value;
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Text('Salvar'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      // apaga lista de compras
                      onDismissed: (direction) {
                        setState(() {
                          listasDeCompras.removeAt(index);
                        });
                      },
                    ),
                    Divider(), 
                  ],
                );
              },
            ),
          ),
        ],
      ),

      // vai pra pagina de adicionar nova lsita
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CriarComprasView(addCompras: addLista),
            ),
          );
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}